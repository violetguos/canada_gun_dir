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
export const RESTRICTED = new Pal(isRestricted);
export const NON_RESTRICTED = new Pal(!isRestricted);
