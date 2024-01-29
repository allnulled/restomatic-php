export default (components) => {
    return [
        {
            path: "/about-us",
            component: components.AboutPage,
        },
        {
            path: "/contact",
            component: components.ContactPage,
        },
        {
            path: "/settings",
            component: components.SettingsPage,
        },
        {
            path: "/zcomponents",
            component: components.ZcomponentsSamplePage,
        },
        {
            path: "/",
            alias: "/home",
            component: components.HomePage,
        },
    ];
}