# 0: {id: "repository.docker.gc", name: "Docker - Delete unused manifests and images", exposed: true,…}
#   exposed: true
#   formFields: [{id: "repositoryName", type: "combobox", label: "Repository",…}]
#     0: {id: "repositoryName", type: "combobox", label: "Repository",…}
#   id: "repository.docker.gc"
#   name: "Docker - Delete unused manifests and images"
nexus3_task 'Docker - Delete unused manifests and images' do
  task_type 'repository.docker.gc'
  task_crontab '0 0 1 * * ?'
  properties {'repositoryName' => 'repository_name'}
end

# 1: {id: "repository.docker.upload-purge", name: "Docker - Delete incomplete uploads", exposed: true,…}
#   exposed: true
#   formFields: [{id: "age", type: "number", label: "Age in hours",…}]
#     0: {id: "age", type: "number", label: "Age in hours",…}
#   id: "repository.docker.upload-purge"
#   name: "Docker - Delete incomplete uploads"
nexus3_task 'Docker - Delete incomplete uploads' do
  task_type 'repository.docker.upload-purge'
  task_crontab '0 0 1 * * ?'
  properties {'age' => 1234}
end

# 2: {id: "repository.cleanup", name: "Admin - Cleanup repositories using their associated policies",…}
#   exposed: false
#   id: "repository.cleanup"
#   name: "Admin - Cleanup repositories using their associated policies"
nexus3_task 'Admin - Cleanup repositories using their associated policies' do
  task_type 'repository.cleanup'
  task_crontab '0 0 1 * * ?'
end

# 3: {id: "repository.storage-facet-cleanup", name: "Storage facet cleanup", exposed: false, formFields: []}
#   exposed: false
#   id: "repository.storage-facet-cleanup"
#   name: "Storage facet cleanup"
nexus3_task 'Storage facet cleanup' do
  task_type 'repository.storage-facet-cleanup'
  task_crontab '0 0 1 * * ?'
end

# 4: {id: "repository.purge-unused", name: "Repository - Delete unused components", exposed: true,…}
#   exposed: true
#   formFields: [{id: "repositoryName", type: "combobox", label: "Repository",…},…]
#     0: {id: "repositoryName", type: "combobox", label: "Repository",…}
#     1: {id: "lastUsed", type: "number", label: "Last used in days",…}
#   id: "repository.purge-unused"
#   name: "Repository - Delete unused components"
nexus3_task 'Repository - Delete unused components' do
  task_type 'repository.docker.upload-purge'
  task_crontab '0 0 1 * * ?'
  properties {'repositoryName' => 'TODO: deal with combobox','lastUsed' => 123,}
end

# 5: {id: "repository.maven.rebuild-metadata",…}
#   exposed: true
#   formFields: [{id: "repositoryName", type: "combobox", label: "Repository",…},…]
#     0: {id: "repositoryName", type: "combobox", label: "Repository",…}
#     1: {id: "groupId", type: "string", label: "GroupId",…}
#     2: {id: "artifactId", type: "string", label: "ArtifactId (only if GroupId given)",…}
#     3: {id: "baseVersion", type: "string", label: "Base Version (only if ArtifactId given)",…}
#     4: {id: "rebuildChecksums", type: "checkbox", label: "Rebuild checksums",…}
#   id: "repository.maven.rebuild-metadata"
#   name: "Repair - Rebuild Maven repository metadata (maven-metadata.xml)"
nexus3_task 'Repair - Rebuild Maven repository metadata (maven-metadata.xml)' do
  task_type 'repository.maven.rebuild-metadata'
  task_crontab '0 0 1 * * ?'
  # TODO: deal with combobox & checkbox
  properties {'repositoryName' => nil,
              'groupId' => 'group',
              'artifactId' => 'artifact',
              'baseVersion' => 'version',
              'rebuildChecksums' => nil }
end

# : {id: "healthcheck", name: "Check for new report availability", exposed: false, formFields: []}
#   exposed: false
#   id: "healthcheck"
#   name: "Check for new report availability"
nexus3_task 'Check for new report availability' do
  task_type 'healthcheck'
  task_crontab '0 0 1 * * ?'
end
# : {id: "repository.yum.rebuild.metadata", name: "Repair - Rebuild Yum repository metadata (repodata)",…}
#   exposed: true
#   formFields: [{id: "repositoryName", type: "combobox", label: "Repository",…},…]
#     0: {id: "repositoryName", type: "combobox", label: "Repository",…}
#     1: {id: "yumMetadataCaching", type: "checkbox", label: "Soft repair",…}
#   id: "repository.yum.rebuild.metadata"
#   name: "Repair - Rebuild Yum repository metadata (repodata)"
nexus3_task 'Repair - Rebuild Yum repository metadata (repodata)' do
  task_type 'repository.yum.rebuild.metadata'
  task_crontab '0 0 1 * * ?'
  #TODO: comobox & checkbox
  properties {'repositoryName' => nil,
              'yumMetadataCaching' => nil}
end

# : {id: "firewall.audit", name: "Repository Audit", exposed: false, formFields: []}
#   exposed: false
#   id: "firewall.audit"
#   name: "Repository Audit"
nexus3_task 'Repository Audit' do
  task_type 'firewall.audit'
  task_crontab '0 0 1 * * ?'
end

# : {id: "tasklog.cleanup", name: "Task log cleanup", exposed: false, formFields: []}
#   exposed: false
#   id: "tasklog.cleanup"
#   name: "Task log cleanup"
nexus3_task 'Task log cleanup' do
  task_type 'tasklog.cleanup'
  task_crontab '0 0 1 * * ?'
end

# : {id: "repository.maven.publish-dotindex", name: "Maven - Publish Maven Indexer files", exposed: true,…}
#   exposed: true
#   formFields: [{id: "repositoryName", type: "combobox", label: "Repository",…}]
#     0: {id: "repositoryName", type: "combobox", label: "Repository",…}
#   id: "repository.maven.publish-dotindex"
#   name: "Maven - Publish Maven Indexer files"
nexus3_task 'Maven - Publish Maven Indexer files' do
  task_type 'repository.maven.publish-dotindex'
  task_crontab '0 0 1 * * ?'
  properties {'repositoryName' => nil}
end

# : {id: "repository.npm.reindex", name: "Repair - Reconcile npm /-/v1/search metadata", exposed: true,…}
#   exposed: true
#   formFields: [{id: "repositoryName", type: "combobox", label: "Repository",…}]
#     0: {id: "repositoryName", type: "combobox", label: "Repository",…}
#   id: "repository.npm.reindex"
#   name: "Repair - Reconcile npm /-/v1/search metadata"
nexus3_task 'Repair - Reconcile npm /-/v1/search metadata' do
  task_type 'repository.npm.reindex'
  task_crontab '0 0 1 * * ?'
  properties {'repositoryName' => nil}
end
# : {id: "create.browse.nodes", name: "Repair - Rebuild repository browse", exposed: true,…}
#   exposed: true
#   formFields: [{id: "repositoryName", type: "combobox", label: "Repository",…}]
#     0: {id: "repositoryName", type: "combobox", label: "Repository",…}
#   id: "create.browse.nodes"
#   name: "Repair - Rebuild repository browse"
nexus3_task 'Repair - Rebuild repository browse' do
  task_type 'create.browse.nodes'
    task_crontab '0 0 1 * * ?'
  properties {'repositoryName' => nil}
end

# : {id: "blobstore.rebuildComponentDB", name: "Repair - Reconcile component database from blob store",…}
#   exposed: true
#   formFields: [{id: "blobstoreName", type: "combobox", label: "Blob store",…},…]
#     0: {id: "blobstoreName", type: "combobox", label: "Blob store",…}
#     1: {id: "dryRun", type: "checkbox", label: "Dry Run", helpText: "Log actions, but make no changes.",…}
#     2: {id: "restoreBlobs", type: "checkbox", label: "Restore blob metadata",…}
#     3: {id: "undeleteBlobs", type: "checkbox", label: "Un-delete referenced blobs",…}
#     4: {id: "integrityCheck", type: "checkbox", label: "Integrity check",…}
#   id: "blobstore.rebuildComponentDB"
#   name: "Repair - Reconcile component database from blob store"
nexus3_task 'Repair - Reconcile component database from blob store' do
  task_type 'blobstore.rebuildComponentDB'
  task_crontab '0 0 1 * * ?'
  # TODO: combobox
  properties {'combobox' => nil,
              'dryRun' => nil,
              'restoreBlobs' => nil,
              'undeleteBlobs' => nil,
              'integrityCheck' => nil}
end

# : {id: "repository.maven.remove-snapshots", name: "Maven - Delete SNAPSHOT", exposed: true,…}
#   exposed: true
#   formFields: [{id: "repositoryName", type: "combobox", label: "Repository",…},…]
#     0: {id: "repositoryName", type: "combobox", label: "Repository",…}
#     1: {id: "minimumRetained", type: "number", label: "Minimum snapshot count",…}
#     2: {id: "snapshotRetentionDays", type: "number", label: "Snapshot retention (days)",…}
#     3: {id: "removeIfReleased", type: "checkbox", label: "Remove if released",…}
#     4: {id: "gracePeriodInDays", type: "number", label: "Grace period after release (days)",…}
#   id: "repository.maven.remove-snapshots"
#   name: "Maven - Delete SNAPSHOT"
nexus3_task 'Maven - Delete SNAPSHOT' do
  task_type 'repository.maven.remove-snapshots'
  task_crontab '0 0 1 * * ?'
  # TODO: combobox & checkbox
  properties {'repositoryName' => nil,
              'minimumRetained' => 123,
              'snapshotRetentionDays' => 123,
              'removeIfReleased' => nil,
              'gracePeriodInDays' => 123 }
end

# : {id: "repository.maven.purge-unused-snapshots", name: "Maven - Delete unused SNAPSHOT", exposed: true,…}
#   exposed: true
#   formFields: [{id: "repositoryName", type: "combobox", label: "Repository",…},…]
#     0: {id: "repositoryName", type: "combobox", label: "Repository",…}
#     1: {id: "lastUsed", type: "number", label: "Last used in days",…}
#   id: "repository.maven.purge-unused-snapshots"
#   name: "Maven - Delete unused SNAPSHOT"
nexus3_task 'Maven - Delete unused SNAPSHOT' do
  task_type 'repository.maven.purge-unused-snapshots'
  task_crontab '0 0 1 * * ?'
  # TODO: combobox
  properties {'repositoryName' => nil,
              'lastUsed' => 123}
end

# : {id: "blobstore.compact", name: "Admin - Compact blob store", exposed: true,…}
#   exposed: true
#   formFields: [{id: "blobstoreName", type: "combobox", label: "Blob store",…}]
#     0: {id: "blobstoreName", type: "combobox", label: "Blob store",…}
#   id: "blobstore.compact"
#   name: "Admin - Compact blob store"
nexus3_task 'Admin - Compact blob store' do
  task_type 'blobstore.compact'
  task_crontab '0 0 1 * * ?'
  # TODO: combobox
  properties {'blobstoreName' => nil}
end

# : {id: "repository.maven.unpublish-dotindex", name: "Maven - Unpublish Maven Indexer files",…}
#   exposed: true
#   formFields: [{id: "repositoryName", type: "combobox", label: "Repository",…}]
#     0: {id: "repositoryName", type: "combobox", label: "Repository",…}
#   id: "repository.maven.unpublish-dotindex"
#   name: "Maven - Unpublish Maven Indexer files"
nexus3_task 'Maven - Unpublish Maven Indexer files' do
  task_type 'repository.maven.unpublish-dotindex'
  task_crontab '0 0 1 * * ?'
  # TODO: combobox
  properties {'repositoryName' => nil}
end

# : {id: "firewall.ignore-patterns", name: "Firewall ignore patterns", exposed: false, formFields: []}
#   exposed: false
#   id: "firewall.ignore-patterns"
#   name: "Firewall ignore patterns"
nexus3_task 'Firewall ignore patterns' do
  task_type 'firewall.ignore-patterns'
  task_crontab '0 0 1 * * ?'
end

# : {id: "script", name: "Admin - Execute script", exposed: true,…}
#   exposed: true
#   formFields: [{id: "language", type: "string", label: "Language", helpText: "Script language", required: true,…},…]
#     0: {id: "language", type: "string", label: "Language", helpText: "Script language", required: true,…}
#     1: {id: "source", type: "text-area", label: "Source", helpText: "Script source", required: true,…}
#   id: "script"
#   name: "Admin - Execute script"
nexus3_task 'Admin - Execute script' do
  task_type 'script'
  task_crontab '0 0 1 * * ?'
  properties {'language' => 'lang',
              'source' => 'script source'}
end

# : {id: "rebuild.asset.uploadMetadata", name: "Repair - Reconcile date metadata from blob store",…}
#   exposed: true
#   id: "rebuild.asset.uploadMetadata"
#   name: "Repair - Reconcile date metadata from blob store"
nexus3_task 'Repair - Reconcile date metadata from blob store' do
  task_type 'rebuild.asset.uploadMetadata'
  task_crontab '0 0 1 * * ?'
end

# : {id: "security.purge-api-keys", name: "Admin - Delete orphaned API keys", exposed: true,…}
#   exposed: true
#   id: "security.purge-api-keys"
#   name: "Admin - Delete orphaned API keys"
nexus3_task 'Admin - Delete orphaned API keys' do
  task_type 'security.purge-api-keys'
  task_crontab '0 0 1 * * ?'
end

# : {id: "repository.rebuild-index", name: "Repair - Rebuild repository search", exposed: true,…}
#   exposed: true
#   formFields: [{id: "repositoryName", type: "combobox", label: "Repository",…}]
#     0: {id: "repositoryName", type: "combobox", label: "Repository",…}
#   id: "repository.rebuild-index"
#   name: "Repair - Rebuild repository search"
nexus3_task 'Repair - Rebuild repository search' do
  task_type'repository.rebuild-index'
  task_crontab '0 0 1 * * ?'
  properties {'repositoryName' => nil}
end

# : {id: "db.backup", name: "Admin - Export databases for backup", exposed: true,…}
#   exposed: true
#   formFields: [{id: "location", type: "string", label: "Backup location",…}]
#     0: {id: "location", type: "string", label: "Backup location",…}
#   id: "db.backup"
#   name: "Admin - Export databases for backup"
nexus3_task 'Admin - Export databases for backup' do
  task_type 'db.backup'
  task_crontab '0 0 1 * * ?'
  properties {'location' => 'backup_location'}
end
