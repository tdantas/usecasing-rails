class UsecasingGenerator < Rails::Generators::NamedBase

  argument :depends, type: :array, default: [], banner: "depends USECASE"

  source_root File.expand_path('../templates', __FILE__)

  def generate
    template "usecase.erb", "app/usecases/#{file_name}.rb"
  end

end