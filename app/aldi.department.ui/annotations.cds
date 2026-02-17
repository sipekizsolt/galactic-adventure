using SpacefarerService as service from '../../srv/spacefarer-service';

annotate service.Department with @(
  UI.Facets : [
    {
      $Type  : 'UI.CollectionFacet',
      Label  : 'General',
      Facets : [
        {
          $Type  : 'UI.ReferenceFacet',
          Target : '@UI.FieldGroup#General'
        }
      ]
    },
    {
      $Type  : 'UI.ReferenceFacet',
      Label  : 'Spacefarers',
      Target : 'spacefarers/@UI.LineItem'
    }
  ],
    UI.LineItem : [
    { $Type: 'UI.DataField', Value: name }
  ],

  UI.FieldGroup #General : {
    $Type : 'UI.FieldGroupType',
    Data : [
      { $Type: 'UI.DataField', Value: name }
    ]
  },

  UI.CreateHidden: false
);