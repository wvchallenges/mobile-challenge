module.exports = (api) => {
  api.cache(true);
  return {
    plugins: [
      [
        'module-resolver',
        {
          alias: {
            api: './src/api',
            assets: './src/assets',
            components: './src/components',
            locales: './src/locales',
            navigation: './src/navigation',
            routes: './src/routes',
            state: './src/state',
            styles: './src/styles',
          },
          root: './src',
        },
      ],
    ],
    presets: ['module:metro-react-native-babel-preset'],
  };
};
