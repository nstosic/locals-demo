String singularizeOrPluralize(int quantity, String pluralForm) {
  return quantity > 1 ? pluralForm : pluralForm.substring(0, pluralForm.length - 1);
}
