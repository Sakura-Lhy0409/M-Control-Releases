(() => {
    const root = document.documentElement;
    const navToggle = document.getElementById("navToggle");
    const navMenu = document.getElementById("navMenu");
    const themeToggle = document.getElementById("themeToggle");
    const progress = document.getElementById("scrollProgress");
    const prefersReducedMotion = window.matchMedia("(prefers-reduced-motion: reduce)").matches;

    const storedTheme = localStorage.getItem("m-control-site-theme");
    root.dataset.theme = storedTheme === "light" ? "light" : "dark";

    const updateThemeButton = () => {
        if (!themeToggle) return;
        const isDark = root.dataset.theme === "dark";
        themeToggle.setAttribute("aria-label", isDark ? "切换到浅色模式" : "切换到夜间模式");
        const label = themeToggle.querySelector("span");
        if (label) label.textContent = isDark ? "夜间" : "浅色";
    };

    updateThemeButton();

    themeToggle?.addEventListener("click", () => {
        root.dataset.theme = root.dataset.theme === "dark" ? "light" : "dark";
        localStorage.setItem("m-control-site-theme", root.dataset.theme);
        updateThemeButton();
    });

    const setMenuOpen = (open) => {
        if (!navToggle || !navMenu) return;
        navToggle.setAttribute("aria-expanded", String(open));
        navToggle.setAttribute("aria-label", open ? "关闭导航菜单" : "打开导航菜单");
        navMenu.classList.toggle("is-open", open);
    };

    navToggle?.addEventListener("click", () => {
        setMenuOpen(navToggle.getAttribute("aria-expanded") !== "true");
    });

    document.addEventListener("click", (event) => {
        if (!navMenu?.classList.contains("is-open")) return;
        if (event.target instanceof Node && (navMenu.contains(event.target) || navToggle?.contains(event.target))) return;
        setMenuOpen(false);
    });

    document.addEventListener("keydown", (event) => {
        if (event.key === "Escape") setMenuOpen(false);
    });

    document.querySelectorAll('a[href^="#"]').forEach((link) => {
        link.addEventListener("click", (event) => {
            const targetId = link.getAttribute("href");
            if (!targetId || targetId === "#") return;

            const target = document.querySelector(targetId);
            if (!target) return;

            event.preventDefault();
            const top = target.getBoundingClientRect().top + window.scrollY - 92;
            window.scrollTo({ top, behavior: prefersReducedMotion ? "auto" : "smooth" });
            setMenuOpen(false);
        });
    });

    const updateProgress = () => {
        if (!progress) return;
        const max = document.documentElement.scrollHeight - window.innerHeight;
        const ratio = max > 0 ? Math.min(window.scrollY / max, 1) : 0;
        progress.style.transform = `scaleX(${ratio})`;
    };

    updateProgress();
    window.addEventListener("scroll", updateProgress, { passive: true });
    window.addEventListener("resize", updateProgress);

    document.querySelectorAll(".segment-tab").forEach((tab) => {
        tab.addEventListener("click", () => {
            const panelName = tab.dataset.panel;
            if (!panelName) return;

            document.querySelectorAll(".segment-tab").forEach((item) => {
                const active = item === tab;
                item.classList.toggle("is-active", active);
                item.setAttribute("aria-selected", String(active));
                item.tabIndex = active ? 0 : -1;
            });

            document.querySelectorAll("[data-panel-content]").forEach((panel) => {
                const active = panel.dataset.panelContent === panelName;
                panel.hidden = !active;
                panel.classList.toggle("is-active", active);
            });
        });

        tab.addEventListener("keydown", (event) => {
            if (!["ArrowLeft", "ArrowRight", "Home", "End"].includes(event.key)) return;
            const tabs = Array.from(document.querySelectorAll(".segment-tab"));
            const index = tabs.indexOf(tab);
            let nextIndex = index;

            if (event.key === "ArrowRight") nextIndex = (index + 1) % tabs.length;
            if (event.key === "ArrowLeft") nextIndex = (index - 1 + tabs.length) % tabs.length;
            if (event.key === "Home") nextIndex = 0;
            if (event.key === "End") nextIndex = tabs.length - 1;

            event.preventDefault();
            tabs[nextIndex]?.focus();
            tabs[nextIndex]?.click();
        });
    });

    if (!prefersReducedMotion && "IntersectionObserver" in window) {
        const observer = new IntersectionObserver((entries) => {
            entries.forEach((entry) => {
                if (!entry.isIntersecting) return;
                entry.target.classList.add("is-visible");
                observer.unobserve(entry.target);
            });
        }, { threshold: 0.14 });

        document.querySelectorAll(".reveal").forEach((element) => observer.observe(element));
    } else {
        document.querySelectorAll(".reveal").forEach((element) => element.classList.add("is-visible"));
    }
})();
