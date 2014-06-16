namespace :symlink do
  desc 'Upload symlink files'
  task :local_upload do
    on roles(:app), in: :sequence, wait: 5 do
      labels = ENV['LABELS'].split(',') rescue []
      symlinks = fetch(:symlinks)
      symlinks.select { |symlink| labels.include? symlink[:label].to_s }.each { |symlink|
        upload! symlink[:path], "#{shared_path}/#{symlink[:path]}", via: :scp if File.file?(symlink[:path])
      }
    end
  end
end
