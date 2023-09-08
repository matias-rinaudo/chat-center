every 15.min do
  rake 'update_shipping_status_job'
end

every 15.min, :at => '4:30 am' do
  runner UpdateShippingStatusJob.perform_async
end