(() => {
  const script = document.currentScript;
  const language = script?.dataset.language;

  if (language) {
    document.documentElement.lang = language;
  }
})();
