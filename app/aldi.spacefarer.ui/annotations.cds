using SpacefarerService as service from '../../srv/spacefarer-service';

annotate service.Spacefarer with @(
  UI.LineItem : [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: originPlanet },
    { $Type: 'UI.DataField', Value: spacesuitColor },
    { $Type: 'UI.DataField', Value: stardustCollection },
    { $Type: 'UI.DataField', Value: wormholeNavSkill },
{
  $Type: 'UI.DataField',
  Value: department_ID,
  Label: 'Department'
}
  ],

  UI.FieldGroup #General : {
    $Type : 'UI.FieldGroupType',
    Data : [
      { $Type: 'UI.DataField', Value: name },
      { $Type: 'UI.DataField', Value: originPlanet },
      { $Type: 'UI.DataField', Value: spacesuitColor },
      { $Type: 'UI.DataField', Value: stardustCollection },
      { $Type: 'UI.DataField', Value: wormholeNavSkill },
      { $Type: 'UI.DataField', Value: department_ID, Label: 'Department' },
    {
      $Type : 'UI.DataFieldWithNavigationPath',
      Value : department_ID,
      Target : toDepartment,
      Label : 'Department'
    }
    ]
  },

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
    }
  ],

  UI.CreateHidden: false
);

/* Header */

annotate service.Spacefarer with @UI.HeaderInfo: {
  TypeName: 'Spacefarer',
  TypeNamePlural: 'Spacefarers',
  Title: {
    $Type: 'UI.DataField',
    Value: name
  },
  Description: {
    $Type: 'UI.DataField',
    Value: originPlanet
  }
};

annotate service.Department with @UI.HeaderInfo: {
  TypeName: 'Department',
  TypeNamePlural: 'Departments',
  Title: {
    $Type: 'UI.DataField',
    Value: name
  }
};

/* Value help */

annotate service.Spacefarer:department with @(
  Common.ValueList : {
    $Type : 'Common.ValueListType',
    CollectionPath : 'Department',
    Parameters : [
      {
        $Type : 'Common.ValueListParameterInOut',
        LocalDataProperty : department_ID,
        ValueListProperty : 'ID'
      }
    ],
    Label : 'Department'
  },
  Common.ValueListWithFixedValues : true,
    Common.Text : department.name,
    Common.Text.@UI.TextArrangement : #TextOnly,
);

annotate service.Department with {
    ID @(
        Common.Text : name,
        Common.Text.@UI.TextArrangement : #TextOnly,
)};

annotate service.Spacefarer with @restrict: [
  {
    grant: ['READ', 'UPDATE', 'DELETE'],
    to: 'spacefarer',
    where: 'originPlanet = $user.planet'
  },
  {
    grant: ['CREATE'],
    to: 'spacefarer'
  }
];