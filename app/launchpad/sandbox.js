window["sap-ushell-config"] = {
  defaultRenderer: "fiori2",
  renderers: {
    fiori2: {
      componentData: {
        config: {
          search: "hidden",
          sapHorizonEnabled: true,
          searchBusinessObjects: "hidden",
          rootIntent: "Shell-home",
          sizeBehaviorConfigurable: true,
          preloadLibrariesForRootIntent: false
        }
      }
    }
  },
  bootstrapPlugins: {
    "RuntimeAuthoringPlugin": {
      "component": "sap.ushell.plugins.rta",
      "config": {
        validateAppVersion: false
      }
    }
  },
  services: {
    LaunchPage: {
      adapter: {
        config: {
          groups: [{
            tiles: [{
                title: "Spacefarers",
                targetURL: "#spacefarer-display"
              },
              {
                title: "Departments",
                targetURL: "#department-display"
              }
            ]
          }]
        }
      }
    },
ClientSideTargetResolution: {
  adapter: {
    config: {
      inbounds: {
        "spacefarer-display": {
          semanticObject: "spacefarer",
          action: "display",
          title: "Spacefarers",
          signature: {
            parameters: {},
            additionalParameters: "allowed"
          },
          resolutionResult: {
            applicationType: "URL",
            additionalInformation: "SAPUI5.Component=aldi.spacefarer.ui",
            url: "../aldi.spacefarer.ui/webapp"
          }
        },
        "department-display": {
          semanticObject: "department",
          action: "display",
          title: "Departments",
          signature: {
            parameters: {},
            additionalParameters: "allowed"
          },
          resolutionResult: {
            applicationType: "URL",
            additionalInformation: "SAPUI5.Component=aldi.department.ui",
            url: "../aldi.department.ui/webapp"
          }
        }
      }
    }
  }
}
  }
};