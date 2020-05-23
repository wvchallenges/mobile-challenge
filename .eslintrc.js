module.exports = {
  env: {
    es6: true,
    'jest/globals': true,
  },
  extends: [
    'airbnb',
    'plugin:@typescript-eslint/recommended',
    'plugin:react/recommended',
    'plugin:prettier/recommended',
    'prettier/@typescript-eslint',
    'prettier/react',
  ],
  globals: {
    Atomics: 'readonly',
    __DEV__: 'readonly',
    SharedArrayBuffer: 'readonly',
    fetch: 'readonly',
  },
  parser: '@typescript-eslint/parser',
  parserOptions: {
    ecmaVersion: 2018,
    sourceType: 'module',
  },
  plugins: ['react', 'react-hooks', 'filenames', 'import', 'jest'],
  rules: {
    'react-hooks/rules-of-hooks': 'error',
    'react-hooks/exhaustive-deps': 'warn',
    'react/jsx-props-no-spreading': 'off',
    'react/jsx-filename-extension': [
      'error',
      {
        extensions: ['.tsx'],
      },
    ],
    '@typescript-eslint/ban-ts-ignore': 'off',
    '@typescript-eslint/no-empty-function': 'off',
    '@typescript-eslint/no-inferrable-types': 'off',
    '@typescript-eslint/no-unused-expressions': ['error'],
    '@typescript-eslint/no-unused-vars': [
      'error',
      {
        argsIgnorePattern: '^_',
      },
    ],
    'no-unused-expressions': 'off',
    'no-underscore-dangle': ['error', { allow: ['__typename'] }],
    'filenames/match-exported': ['error', [null, 'kebab']],
    'filenames/match-regex': ['error', '^[a-z]+(-[a-z]+)*(\\.[a-z]+)?$', true], // kebab-case with optional suffix (foo-bar.config.js)
    'import/no-unresolved': ['error', { caseSensitive: false }],
    'import/extensions': ['error', 'never'],
    'import/no-cycle': 'error',
    'import/order': [
      'error',
      {
        groups: [
          ['builtin', 'external'],
          'internal',
          'parent',
          ['sibling', 'index'],
        ],
        'newlines-between': 'always-and-inside-groups',
      },
    ],
    'sort-keys': 'error',
    'no-restricted-imports': [
      'error',
      {
        patterns: ['../../*'], // relative imports are allowed only up two one directory above the current
      },
    ],
  },
  overrides: [
    {
      files: ['*.js'],
      rules: {
        '@typescript-eslint/explicit-function-return-type': ['off'],
      },
    },
  ],
  settings: {
    'import/resolver': {
      'babel-module': {},
      typescript: {},
    },
  },
};
