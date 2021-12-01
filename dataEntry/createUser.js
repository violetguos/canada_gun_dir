const isRestricted = true;
class Pal {
    constructor(isRestricted){
      this.isRestricted = isRestricted;
      if (this.isRestricted){
        this.name = "restricted";
      }
      else{
        this.name = "non-restricted";
      }
    }
}
const RESTRICTED = new Pal(isRestricted);
const NON_RESTRICTED = new Pal(!isRestricted);

class User {
  constructor(username, clubs, license, guns, province, city_region, last_updated){
    this.username = username;
    this.clubs = clubs;
    this.license = license;
    this.guns = guns;
    this.province = province;
    this.city_region = city_region;
    this.last_updated = last_updated;
  } 
}

const user1 = new User("OfficerAdvil", "", RESTRICTED, ["rifles", "pistols", "shotguns"], "alberta", "airdrie", Date.now());
const user2 = new User("Chest_Treetruck", NON_RESTRICTED, "Spruce Grove Gun Club", ["rifles"], "alberta", "Beaumont", Date.now() );

const data = JSON.stringify([user1, user2], null, 4);

const fs = require('fs');
fs.writeFile('data.json', data, (err) => {
  if (err) {
      throw err;
  }
  console.log("JSON data is saved.");
});
