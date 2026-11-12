- ~~Switch from CSV to Google Sheets to enable people to contribute.~~
- Automate ingestion of data/regular_queries.txt.
  - Need compliance to get more YouTube API quota for this, as currently we do not have
    enough daily quota to run all the queries (we will get an API exception).
    To get compliance, need to fill out compliance form, see https://developers.google.com/youtube/v3/guides/quota_and_compliance_audits
  - Once we have compliance, we can for example have a daily cronjob for something like:

     ```sh
     git pull origin main && \
       flask ingest-csv data/vods.csv && \
       flask run-regular-queries && \  # <this is what needs to be done>
       flask export-vods data/vods.csv && \
       git add . && git commit -m "Automatic regular queries" && git push origin main
     ```

- Add Project+ YouTube channels to data/channel_ids.txt and data/regular_queries.txt.
- Work on vod-splitter for faster ingestion of large untagged vods https://github.com/Ludini1/vod-splitter
- Backfill large untagged vods (for example Hop On has a lot of good high-level content, Hop On #24 - #1 need to be ingested)
- Maybe a Google Form for people to suggest YouTube channels to be added, to reduce DMs? I don't feel strongly, I'm fine
  with the current setup.
