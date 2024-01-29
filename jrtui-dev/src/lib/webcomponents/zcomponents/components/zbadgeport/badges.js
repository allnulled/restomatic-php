class BadgesManager {

    async initialize(app) {
        try {
            this.app = app;
        } catch (error) {
            console.error(error);
            throw error;
        }
    }

    send(...args) {
        return this.app.$refs.zbadgeport.send(...args);
    }

    closeAll() {
        return this.app.$refs.zbadgeport.closeAll();
    }

}

const badges = new BadgesManager();

export default badges;