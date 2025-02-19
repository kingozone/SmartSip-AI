export const formatDate = (date) => {
    const options = { year: 'numeric', month: 'long', day: 'numeric' };
    return new Date(date).toLocaleDateString(undefined, options);
};

export const validateInput = (input) => {
    return input && input.trim() !== '';
};

export const calculateBAC = (weight, alcoholConsumed, hours) => {
    const r = 0.68; // Widmark formula constant for men
    return (alcoholConsumed * 5.14 / weight * r) - 0.015 * hours;
};

export const getCurrentDate = () => {
    return new Date().toISOString().split('T')[0];
};