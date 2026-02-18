using { managed } from '@sap/cds/common';
namespace app;

entity Spacefarer: managed {
  key ID :  UUID @cds.on.insert : $uuid;
  name : String @title: 'Name';
  originPlanet : String @title: 'Origin planet' @mandatory;
  wormholeNavSkill : String @title: 'Wormhole navigation skill';
  spacesuitColor : String @title: 'Spacesuit color';
  stardustCollection : Integer @title: 'Stardust collection';
  department: Association to Department;
}

entity Department: managed {
  key ID :  UUID @cds.on.insert : $uuid;
  name : String @title: 'Department';
  spacefarers: Association to many Spacefarer on spacefarers.department = $self;
}