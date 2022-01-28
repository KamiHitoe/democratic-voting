module.exports = {
  root: true,
  env: {
    "browser": true,
    "es2021": true,
    "node": true
  },
  extends: [
    "@nuxtjs/eslint-config-typescript",
    "eslint:recommended",
    "prettier",
    "plugin:prettier/recommended",
    "plugin:nuxt/recommended"
  ],
// parserOptions: {
//     "ecmaVersion": "latest",
//     "parser": "@typescript-eslint/parser",
//     "sourceType": "module"
  // },
  plugins: [
    "prettier"
  ],
  // add your custom rules
  rules: {
    "no-console": "off",
    "no-unused-vars": "off",
    "prettier/prettier": [
        "error",
        {
          "bracketSpacing": true,
          "singleQuote": false,
          "semi": true,
          "trailingComma": "es5",
          "tabWidth": 2,
        }
      ]
    },
  overrides: [
    {
      files: ["*.vue"],
      processor: "vue/.vue"
    }
  ],
}
