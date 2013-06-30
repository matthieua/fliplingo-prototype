class TranslationsController < ApplicationController
  def create
    translation = Translation.new translation_params
    translation.language = translation.account.language.name
    translation.source_language = current_user.language

    case translation.kind
    when 'computer'
      translation.source_language = translation.language
      translation.content = "Tweet translated in #{translation.language.capitalize}..."
      translation.status = 'published'
      translation.published_at = Time.now
    when 'human'
      translation.status = 'processing'
    else
      translation.source_language = translation.language
      translation.content = translation.source
      translation.status = 'published'
      translation.published_at = Time.now
    end

    translation.save

    redirect_to account_path(translation.account)
  end

  private

  def translation_params
    params.permit(:translation => [:account_id, :source, :source_language, :language, :kind, :status])[:translation]
  end
end
