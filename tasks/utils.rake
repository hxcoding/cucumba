desc "Cleanup"
task :clean do
  FileUtils.rm_rf(['pkg','doc','.yardoc'])
end
