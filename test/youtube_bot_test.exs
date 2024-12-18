defmodule YouTubeBotTest do
  use ExUnit.Case
  doctest YouTubeBot

  test "从带时间戳的YouTube链接中提取视频ID" do
    url = "https://www.youtube.com/watch?v=7y8eotcYgy0&t=3s"
    assert YouTubeBot.get_video_id(url) == {:ok, "7y8eotcYgy0"}
  end

  test "从标准YouTube链接中提取视频ID" do
    url = "https://www.youtube.com/watch?v=7y8eotcYgy0"
    assert YouTubeBot.get_video_id(url) == {:ok, "7y8eotcYgy0"}
  end

  test "从视频分享短链接中提取视频ID（带query参数）" do
    url = "https://youtu.be/u5uUukAi_8I?si=M4eComOtkCQNQaIL&t=36"
    assert YouTubeBot.get_video_id(url) == {:ok, "u5uUukAi_8I"}
  end

  test "从视频分享短链接中提取视频ID（不带query参数）" do
    url = "https://youtu.be/u5uUukAi_8I"
    assert YouTubeBot.get_video_id(url) == {:ok, "u5uUukAi_8I"}
  end

  test "处理无效的YouTube链接" do
    url = "https://invalid-url.com"
    assert YouTubeBot.get_video_id(url) == {:error, "无效的YouTube链接"}
  end

  test "处理格式错误的YouTube链接" do
    url = "https://www.youtube.com/watch?invalid"
    assert YouTubeBot.get_video_id(url) == {:error, "无效的YouTube链接"}
  end

  test "fetch_latest_videos/0" do
    assert Enum.count(YouTubeBot.fetch_latest_videos()) > 0
  end
end
