module.exports = {
  // globalSetup: "<rootDir>/test/setup.ts",
  // globalTeardown: "<rootDir>/test/teardown.ts",
  // mapCoverage: true,
  testRegex: "(/__tests__/.*|(\\.|/)(test|spec))\\.(js|ts)$",
  // moduleNameMapper: {
  //   "^@/(.*)$": "<rootDir>/$1",
  //   "^~/(.*)$": "<rootDir>/$1",
  //   "^vue$": "vue/dist/vue.common.js",
  // },
  moduleFileExtensions: ["ts", "js", "vue", "json"],
  transform: {
    "^.+\\.(ts|tsx)$": "ts-jest",
    ".*\\.(vue)$": "vue-jest",
    "^.+\\.vue$": "vue-jest",
  },
  collectCoverage: true,
  collectCoverageFrom: [
    "<rootDir>/components/**/*.vue",
    "<rootDir>/pages/**/*.vue",
  ],
  transformIgnorePatterns: ["<rootDir>/node_modules/(?!lodash-es/.*)"],
  testEnvironment: "jsdom",
};
