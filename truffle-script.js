module.exports = async function(callback) {
  const Directory = artifacts.require('Directory');
  const Organization = artifacts.require('Organization');

  try {
    console.log('instantiating directory at 0x87B82E22e0c8eabED45E59ca2a3551F04A5bf30A')
    const dir = await Directory.at('0x87B82E22e0c8eabED45E59ca2a3551F04A5bf30A');
    await dir.create('http://windingtree.com');
    const organizations = await dir.getOrganizations();
    console.log('organizations', organizations);
    const org = await Organization.at(organizations[0]);
    console.log(await org.getDataUri());
    callback();
  } catch (e) {
    callback(e);
  }
}

