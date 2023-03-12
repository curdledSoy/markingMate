// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
    modules: [
        '@pinia/nuxt',
        'nuxt-windicss',
        '@sidebase/nuxt-auth',
        '@vueuse/nuxt',
        '@formkit/nuxt',

    ],
    pinia: {
        autoImports: [
            'defineStore'
        ]
    }

})
