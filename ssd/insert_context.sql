DELETE FROM ssd_menu_svc.context_config WHERE schema_version = '1.0';

INSERT INTO ssd_menu_svc.context_config(content, schema_version)
VALUES ('{
                  "params": {
                    "maxOrganizationCount": 5,
                    "maxProjectCount": 3
                  },
                  "assets": {
                    "modeSelectorOrganizationValue": "Главный раздел",
                    "modeSelectorProjectHint": "Проект"
                  },
                  "menus": {
                    "modeSelectorMenu": {
                      "groups": [
                        {
                          "key": "recent_projects",
                          "label": "Недавние проекты",
                          "children": [
                            {
                              "key": "all_projects",
                              "label": "Показать все проекты",
                              "link": {
                                "type": "template",
                                "params": {
                                  "template": "${ssd-ui-url}/organization/${organization-key}"
                                }
                              },
                              "as": {
                                "component": "Link"
                              }
                            }
                          ]
                        },
                        {
                          "key": "main",
                          "label": "Главный раздел",
                          "children": []
                        }
                      ]
                    },
                    "footerMenu": {
                      "items": []
                    },
                    "functionalMenu": {
                      "groups": [
                        {
                          "key": "organizations",
                          "label": "Мои организации",
                          "children": [
                            {
                              "key": "all_organizations",
                              "label": "Показать все организации",
                              "link": {
                                "type": "template",
                                "params": {
                                  "template": "${ssd-ui-url}/organization"
                                }
                              },
                              "as": {
                                "component": "Link"
                              }
                            }
                          ]
                        },
                        {
                          "key": "main",
                          "children": [
                            {
                              "key": "user_profile",
                              "icon": "user-profile",
                              "label": "Мой профиль",
                              "link": {
                                "type": "template",
                                "params": {
                                  "template": "${ssd-ui-url}/organization/${organization-key}/users/${user-id}/profile"
                                }
                              }
                            },
                            {
                              "key": "user_room",
                              "icon": "user-room",
                              "label": "Моя переговорная",
                              "link": {
                                "type": "template",
                                "params": {
                                  "template": "${ssd-ui-url}/organization/${organization-key}/users/${user-id}/room"
                                }
                              },
                              "require": [
                                {
                                  "type": "user-has-room"
                                }
                              ]
                            },
                            {
                              "key": "user_manual",
                              "icon": "user-manual",
                              "label": "Помощь",
                              "link": {
                                "type": "template",
                                "params": {
                                  "template": "${ssd-ui-url}/organization/${organization-key}/help"
                                }
                              }
                            },
                            {
                              "key": "server_time",
                              "label": "Время сервера:",
                              "as": {
                                "component": "ServerTime"
                              }
                            }
                          ]
                        },
                        {
                          "key": "footer",
                          "children": [
                            {
                              "key": "logout",
                              "icon": "logout",
                              "label": "Выйти",
                              "action": "logout"
                            }
                          ]
                        }
                      ]
                    }
                  },
                  "contexts": {
                    "organization": {
                      "mainMenu": {
                        "items": [
                          {
                            "key": "projects",
                            "icon": "projects",
                            "label": "Проекты",
                            "link": {
                              "type": "template",
                              "params": {
                                "template": "${ssd-ui-url}/organization/${organization-key}"
                              }
                            }
                          },
                          {
                            "key": "users",
                            "icon": "users",
                            "label": "Пользователи",
                            "link": {
                              "type": "template",
                              "params": {
                                "template": "${ssd-ui-url}/organization/${organization-key}/users"
                              }
                            }
                          },
                          {
                            "key": "roles",
                            "icon": "roles",
                            "label": "Роли",
                            "link": {
                              "type": "template",
                              "params": {
                                "template": "${ssd-ui-url}/organization/${organization-key}/roles"
                              }
                            }
                          },
                          {
                            "key": "billing_and_limits",
                            "icon": "billing-and-limits",
                            "label": "Биллинг и лимиты",
                            "link": {
                              "type": "template",
                              "params": {
                                "template": "${ssd-ui-url}/organization/${organization-key}/billing"
                              }
                            }
                          }
                        ]
                      }
                    },
                    "project": {
                      "mainMenu": {
                        "groups": [
                          {
                            "key": "primary",
                            "children": [
                              {
                                "key": "dashboard",
                                "icon": "dashboard",
                                "label": "Дашборд",
                                "link": {
                                  "type": "template",
                                  "params": {
                                    "template": "${ssd-ui-url}/organization/${organization-key}/project/${project-key}"
                                  }
                                }
                              },
                              {
                                "key": "task_tracker",
                                "icon": "task-tracker",
                                "label": "TaskTracker",
                                "link": {
                                  "type": "project-tool-property",
                                  "params": {
                                    "toolKey": "track",
                                    "propertyKey": "endpoint"
                                  }
                                },
                                "require": [
                                  {
                                    "type": "project-has-tool",
                                    "params": {
                                      "toolKey": "track"
                                    }
                                  }
                                ],
                                "as": {
                                  "component": "ToolMenuLink"
                                }
                              },
                              {
                                "key": "architect",
                                "icon": "architect",
                                "label": "PV Architect",
                                "link": {
                                  "type": "project-tool-property",
                                  "params": {
                                    "toolKey": "arch",
                                    "propertyKey": "endpoint"
                                  }
                                },
                                "require": [
                                  {
                                    "type": "project-has-tool",
                                    "params": {
                                      "toolKey": "arch"
                                    }
                                  }
                                ],
                                "as": {
                                  "component": "ToolMenuLink"
                                }
                              },
                              {
                                "key": "source_control",
                                "icon": "source-control",
                                "label": "SourceControl",
                                "link": {
                                  "type": "project-tool-property",
                                  "params": {
                                    "toolKey": "sc",
                                    "propertyKey": "endpoint"
                                  }
                                },
                                "require": [
                                  {
                                    "type": "project-has-tool",
                                    "params": {
                                      "toolKey": "sc"
                                    }
                                  }
                                ],
                                "as": {
                                  "component": "ToolMenuLink"
                                }
                              },
                              {
                                "key": "dependencies",
                                "icon": "artifactory",
                                "label": "Artifactory",
                                "children": [
                                  {
                                    "key": "dependencies_ci",
                                    "label": "Сборка",
                                    "link": {
                                      "type": "project-tool-property",
                                      "params": {
                                        "toolKey": "nci",
                                        "propertyKey": "endpoint"
                                      }
                                    },
                                    "require": [
                                      {
                                        "type": "project-has-tool",
                                        "params": {
                                          "toolKey": "nci"
                                        }
                                      }
                                    ],
                                    "as": {
                                      "component": "ToolMenuLink"
                                    }
                                  },
                                  {
                                    "key": "deployment",
                                    "label": "Развертывание",
                                    "link": {
                                      "type": "project-tool-property",
                                      "params": {
                                        "toolKey": "ncd",
                                        "propertyKey": "endpoint"
                                      }
                                    },
                                    "require": [
                                      {
                                        "type": "project-has-tool",
                                        "params": {
                                          "toolKey": "ncd"
                                        }
                                      }
                                    ],
                                    "as": {
                                      "component": "ToolMenuLink"
                                    }
                                  }
                                ]
                              },
                              {
                                "key": "pipeliner",
                                "icon": "pipeliner",
                                "label": "Pipeliner",
                                "children": [
                                  {
                                    "key": "continuousIntegration__Сборка",
                                    "label": "Сборка",
                                    "link": {
                                      "type": "project-tool-property",
                                      "params": {
                                        "toolKey": "jci",
                                        "propertyKey": "endpoint"
                                      }
                                    },
                                    "require": [
                                      {
                                        "type": "project-has-tool",
                                        "params": {
                                          "toolKey": "jci"
                                        }
                                      }
                                    ],
                                    "as": {
                                      "component": "ToolMenuLink"
                                    }
                                  },
                                  {
                                    "key": "continuousIntegration__Развертывание",
                                    "label": "Развертывание",
                                    "link": {
                                      "type": "project-tool-property",
                                      "params": {
                                        "toolKey": "jcd",
                                        "propertyKey": "endpoint"
                                      }
                                    },
                                    "require": [
                                      {
                                        "type": "project-has-tool",
                                        "params": {
                                          "toolKey": "jcd"
                                        }
                                      }
                                    ],
                                    "as": {
                                      "component": "ToolMenuLink"
                                    }
                                  }
                                ]
                              },
                              {
                                "key": "continuousIntegration__Поставка",
                                "icon": "orchestra",
                                "label": "Orchestra R",
                                "link": {
                                  "type": "project-tool-property",
                                  "params": {
                                    "toolKey": "dpm",
                                    "propertyKey": "endpoint"
                                  }
                                },
                                "require": [
                                  {
                                    "type": "project-has-tool",
                                    "params": {
                                      "toolKey": "dpm"
                                    }
                                  }
                                ],
                                "as": {
                                  "component": "ToolMenuLink"
                                }
                              },
                              {
                                "key": "staticAnalysis",
                                "icon": "code-scanner",
                                "label": "CodeScanner",
                                "link": {
                                  "type": "project-tool-property",
                                  "params": {
                                    "toolKey": "snr",
                                    "propertyKey": "endpoint"
                                  }
                                },
                                "require": [
                                  {
                                    "type": "project-has-tool",
                                    "params": {
                                      "toolKey": "snr"
                                    }
                                  }
                                ],
                                "as": {
                                  "component": "ToolMenuLink"
                                }
                              },
                              {
                                "key": "apiTesting__mock",
                                "icon": "api-mock",
                                "label": "API Mock & Contract Test",
                                "link": {
                                  "type": "project-tool-property",
                                  "params": {
                                    "toolKey": "mock",
                                    "propertyKey": "endpoint"
                                  }
                                },
                                "require": [
                                  {
                                    "type": "project-has-tool",
                                    "params": {
                                      "toolKey": "mock"
                                    }
                                  }
                                ],
                                "as": {
                                  "component": "ToolMenuLink"
                                }
                              },
                              {
                                "key": "apiTesting__pact",
                                "icon": "pact-work",
                                "label": "PactWork",
                                "link": {
                                  "type": "project-tool-property",
                                  "params": {
                                    "toolKey": "pact",
                                    "propertyKey": "endpoint"
                                  }
                                },
                                "require": [
                                  {
                                    "type": "project-has-tool",
                                    "params": {
                                      "toolKey": "pact"
                                    }
                                  }
                                ],
                                "as": {
                                  "component": "ToolMenuLink"
                                }
                              },
                              {
                                "key": "testData",
                                "icon": "data-test-manager",
                                "label": "Data Test Manager",
                                "link": {
                                  "type": "project-tool-property",
                                  "params": {
                                    "toolKey": "snt",
                                    "propertyKey": "endpoint"
                                  }
                                },
                                "require": [
                                  {
                                    "type": "project-has-tool",
                                    "params": {
                                      "toolKey": "snt"
                                    }
                                  }
                                ],
                                "as": {
                                  "component": "ToolMenuLink"
                                }
                              },
                              {
                                "key": "processMetrics",
                                "icon": "process-monitoring",
                                "label": "Process Monitoring",
                                "link": {
                                  "type": "project-tool-property",
                                  "params": {
                                    "toolKey": "view",
                                    "propertyKey": "endpoint"
                                  }
                                },
                                "require": [
                                  {
                                    "type": "project-has-tool",
                                    "params": {
                                      "toolKey": "view"
                                    }
                                  }
                                ],
                                "as": {
                                  "component": "ToolMenuLink"
                                }
                              },
                              {
                                "key": "dependencyTrack",
                                "icon": "liblic",
                                "label": "Liblic",
                                "link": {
                                  "type": "project-tool-property",
                                  "params": {
                                    "toolKey": "dpt",
                                    "propertyKey": "endpoint"
                                  }
                                },
                                "require": [
                                  {
                                    "type": "project-has-tool",
                                    "params": {
                                      "toolKey": "dpt"
                                    }
                                  }
                                ],
                                "as": {
                                  "component": "ToolMenuLink"
                                }
                              }
                            ]
                          },
                          {
                            "key": "secondary",
                            "children": [
                              {
                                "key": "project_users",
                                "icon": "users",
                                "label": "Пользователи",
                                "link": {
                                  "type": "template",
                                  "params": {
                                    "template": "${ssd-ui-url}/organization/${organization-key}/project/${project-key}/settings"
                                  }
                                }
                              },
                              {
                                "key": "project_room",
                                "icon": "project-room",
                                "label": "Переговорная проекта",
                                "link": {
                                  "type": "template",
                                  "params": {
                                    "template": "${ssd-ui-url}/organization/${organization-key}/project/${project-key}/room"
                                  }
                                },
                                "require": [
                                  {
                                    "type": "project-has-room"
                                  }
                                ]
                              }
                            ]
                          }
                        ]
                      }
                    }
                  }
                }',  '1.0'
);

