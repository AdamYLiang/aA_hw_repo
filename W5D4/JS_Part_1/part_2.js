function titleize(name, callback) {
    let titleized = name.map(name => `Mx. ${name} Jingleheimer Schmidt`);
    callback(titleized);
}

titleize(["Mary", "Brian", "Leo"], (names) => {
    names.forEach(name => console.log(name))
})