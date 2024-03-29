const defaultTheme = require('tailwindcss/defaultTheme')
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './components/**/*.{html,js}',
    './app/views/**/*.{erb,haml,html,slim}',
    './app/views/**/*.{erb,haml,html,slim}',
    'flowbite/**/*.js',
  ],
  theme: {
    extend: {
      colors: {
        primary: {
          "50": "#eff6ff", 
          "100": "#dbeafe", 
          "200": "#bfdbfe", 
          "300": "#93c5fd", 
          "400": "#60a5fa", 
          "500": "#3b82f6", 
          "600": "#2563eb",
          "700": "#1d4ed8",
          "800": "#1e40af",
          "900": "#1e3a8a",
        },
        logo: {
          "green": "#08a54f",
          "dark-green": "#049144",
          "blue": "#06325e",
          "dark-blue": "#01264a"
        }
      },
      fontFamily: {
        body: [
          'Inter', 
          'ui-sans-serif', 
          'system-ui', 
          '-apple-system', 
          'system-ui', 
          'Segoe UI', 
          'Roboto', 
          'Helvetica Neue', 
          'Arial', 
          'Noto Sans', 
          'sans-serif', 
          'Apple Color Emoji', 
          'Segoe UI Emoji', 
          'Segoe UI Symbol', 
          'Noto Color Emoji'
        ],
        sans: [
          'Inter', 
          'ui-sans-serif', 
          'system-ui', 
          '-apple-system', 
          'system-ui', 
          'Segoe UI', 
          'Roboto', 
          'Helvetica Neue', 
          'Arial', 
          'Noto Sans', 
          'sans-serif', 
          'Apple Color Emoji', 
          'Segoe UI Emoji', 
          'Segoe UI Symbol', 
          'Noto Color Emoji'
        ],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/line-clamp'),
    require('@tailwindcss/container-queries'),
    require('flowbite/plugin'),
  ]
}
