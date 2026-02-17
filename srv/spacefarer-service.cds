using { app } from '../db/schema';

service SpacefarerService {

  @odata.draft.enabled
  entity Spacefarer as projection on app.Spacefarer;
  @odata.draft.enabled
  entity Department as projection on app.Department;
}
