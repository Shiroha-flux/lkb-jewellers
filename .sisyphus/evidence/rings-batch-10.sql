DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-bree',
    'Bree',
    'Bree - Elongated Cushion 4 Claw Trilogy with Pear Side Stones and Pave Band Engagement Ring',
    'Inspired by the Meghan trilogy, the Bree engagement ring features a breathtaking elongated cushion cut centre stone, two pear cut side stones and a sweeping cathedral setting atop a 2/3 pavè band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_cushion'::enum_ring_shape,
    'trilogy'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-bree';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-bree-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/bree/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/bree/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-bree-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/bree/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/bree/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-bree-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/bree/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/bree/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-bree-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-bree-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-bree-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-bree-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-bree-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-bree-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-bree-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-bree-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-bree-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-bree-size-0', 1, v_id, 'D'),
      ('ring-bree-size-1', 2, v_id, 'E'),
      ('ring-bree-size-2', 3, v_id, 'F'),
      ('ring-bree-size-3', 4, v_id, 'G'),
      ('ring-bree-size-4', 5, v_id, 'H'),
      ('ring-bree-size-5', 6, v_id, 'I'),
      ('ring-bree-size-6', 7, v_id, 'J'),
      ('ring-bree-size-7', 8, v_id, 'K'),
      ('ring-bree-size-8', 9, v_id, 'L'),
      ('ring-bree-size-9', 10, v_id, 'M'),
      ('ring-bree-size-10', 11, v_id, 'N'),
      ('ring-bree-size-11', 12, v_id, 'O'),
      ('ring-bree-size-12', 13, v_id, 'P'),
      ('ring-bree-size-13', 14, v_id, 'Q'),
      ('ring-bree-size-14', 15, v_id, 'R'),
      ('ring-bree-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-bree-specs',
      v_id,
      '1.5mm',
      '16',
      '6.5 x 4.5mm',
      NULL,
      '2.8g',
      true
    )
    ON CONFLICT (ring_id) DO NOTHING;
  END IF;
END $$;

DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-briar',
    'Briar',
    'Briar - Round 6 Claw Solitaire with Trellis Gallery, Pave Band and Cathedral Setting Engagement Ring',
    'The Briar engagement ring is a unique take on the classic round solitaire design with a beautiful woven trellis setting, six eagle-tipped claws and a sparkling 2/3 pavè band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-briar';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-briar-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/briar/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/briar/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-briar-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/briar/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/briar/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-briar-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/briar/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/briar/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-briar-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-briar-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-briar-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-briar-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-briar-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-briar-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-briar-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-briar-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-briar-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-briar-size-0', 1, v_id, 'D'),
      ('ring-briar-size-1', 2, v_id, 'E'),
      ('ring-briar-size-2', 3, v_id, 'F'),
      ('ring-briar-size-3', 4, v_id, 'G'),
      ('ring-briar-size-4', 5, v_id, 'H'),
      ('ring-briar-size-5', 6, v_id, 'I'),
      ('ring-briar-size-6', 7, v_id, 'J'),
      ('ring-briar-size-7', 8, v_id, 'K'),
      ('ring-briar-size-8', 9, v_id, 'L'),
      ('ring-briar-size-9', 10, v_id, 'M'),
      ('ring-briar-size-10', 11, v_id, 'N'),
      ('ring-briar-size-11', 12, v_id, 'O'),
      ('ring-briar-size-12', 13, v_id, 'P'),
      ('ring-briar-size-13', 14, v_id, 'Q'),
      ('ring-briar-size-14', 15, v_id, 'R'),
      ('ring-briar-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-briar-specs',
      v_id,
      '1.5mm',
      '16',
      '6.5 x 4.5mm',
      NULL,
      '2.8g',
      true
    )
    ON CONFLICT (ring_id) DO NOTHING;
  END IF;
END $$;

DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-brooke',
    'Brooke',
    'Brooke - Pear 3 Claw Solitaire with Round Shoulder Stones Engagement Ring',
    'Brooke is a finely detailed pear solitaire design held within a 3-claw basket setting and framed each side by three round cut accent stones. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-brooke';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-brooke-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/brooke/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/brooke/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-brooke-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/brooke/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/brooke/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-brooke-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/brooke/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/brooke/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-brooke-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-brooke-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-brooke-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-brooke-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-brooke-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-brooke-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-brooke-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-brooke-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-brooke-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-brooke-size-0', 1, v_id, 'D'),
      ('ring-brooke-size-1', 2, v_id, 'E'),
      ('ring-brooke-size-2', 3, v_id, 'F'),
      ('ring-brooke-size-3', 4, v_id, 'G'),
      ('ring-brooke-size-4', 5, v_id, 'H'),
      ('ring-brooke-size-5', 6, v_id, 'I'),
      ('ring-brooke-size-6', 7, v_id, 'J'),
      ('ring-brooke-size-7', 8, v_id, 'K'),
      ('ring-brooke-size-8', 9, v_id, 'L'),
      ('ring-brooke-size-9', 10, v_id, 'M'),
      ('ring-brooke-size-10', 11, v_id, 'N'),
      ('ring-brooke-size-11', 12, v_id, 'O'),
      ('ring-brooke-size-12', 13, v_id, 'P'),
      ('ring-brooke-size-13', 14, v_id, 'Q'),
      ('ring-brooke-size-14', 15, v_id, 'R'),
      ('ring-brooke-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-brooke-specs',
      v_id,
      '1.5mm',
      '16',
      '6.5 x 4.5mm',
      NULL,
      '2.8g',
      true
    )
    ON CONFLICT (ring_id) DO NOTHING;
  END IF;
END $$;

DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-brooklyn',
    'Brooklyn',
    'Brooklyn - Princess 4 Claw Solitaire with Wrap Around Hidden Halo and Pave Band Engagement Ring',
    'Brooklyn is a classic 4-claw princess solitaire boasting a wrap-around hidden halo and half pavé band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-brooklyn';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-brooklyn-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/brooklyn/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/brooklyn/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-brooklyn-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/brooklyn/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/brooklyn/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-brooklyn-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/brooklyn/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/brooklyn/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-brooklyn-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-brooklyn-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-brooklyn-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-brooklyn-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-brooklyn-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-brooklyn-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-brooklyn-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-brooklyn-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-brooklyn-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-brooklyn-size-0', 1, v_id, 'D'),
      ('ring-brooklyn-size-1', 2, v_id, 'E'),
      ('ring-brooklyn-size-2', 3, v_id, 'F'),
      ('ring-brooklyn-size-3', 4, v_id, 'G'),
      ('ring-brooklyn-size-4', 5, v_id, 'H'),
      ('ring-brooklyn-size-5', 6, v_id, 'I'),
      ('ring-brooklyn-size-6', 7, v_id, 'J'),
      ('ring-brooklyn-size-7', 8, v_id, 'K'),
      ('ring-brooklyn-size-8', 9, v_id, 'L'),
      ('ring-brooklyn-size-9', 10, v_id, 'M'),
      ('ring-brooklyn-size-10', 11, v_id, 'N'),
      ('ring-brooklyn-size-11', 12, v_id, 'O'),
      ('ring-brooklyn-size-12', 13, v_id, 'P'),
      ('ring-brooklyn-size-13', 14, v_id, 'Q'),
      ('ring-brooklyn-size-14', 15, v_id, 'R'),
      ('ring-brooklyn-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-brooklyn-specs',
      v_id,
      '1.5mm',
      '16',
      '6.5 x 4.5mm',
      NULL,
      '2.8g',
      true
    )
    ON CONFLICT (ring_id) DO NOTHING;
  END IF;
END $$;

DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-bronte',
    'Bronte',
    'Bronte - Oval 4 Claw Solitaire with Cigar Band and Hidden Halo Engagement Ring',
    'Bronte features a 4-claw oval solitaire, sparkling hidden halo and thick cigar band. This beautiful engagement ring is available in both high and low setting heights. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-bronte';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-bronte-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/bronte/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/bronte/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-bronte-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/bronte/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/bronte/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-bronte-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/bronte/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/bronte/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-bronte-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-bronte-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-bronte-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-bronte-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-bronte-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-bronte-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-bronte-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-bronte-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-bronte-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-bronte-size-0', 1, v_id, 'D'),
      ('ring-bronte-size-1', 2, v_id, 'E'),
      ('ring-bronte-size-2', 3, v_id, 'F'),
      ('ring-bronte-size-3', 4, v_id, 'G'),
      ('ring-bronte-size-4', 5, v_id, 'H'),
      ('ring-bronte-size-5', 6, v_id, 'I'),
      ('ring-bronte-size-6', 7, v_id, 'J'),
      ('ring-bronte-size-7', 8, v_id, 'K'),
      ('ring-bronte-size-8', 9, v_id, 'L'),
      ('ring-bronte-size-9', 10, v_id, 'M'),
      ('ring-bronte-size-10', 11, v_id, 'N'),
      ('ring-bronte-size-11', 12, v_id, 'O'),
      ('ring-bronte-size-12', 13, v_id, 'P'),
      ('ring-bronte-size-13', 14, v_id, 'Q'),
      ('ring-bronte-size-14', 15, v_id, 'R'),
      ('ring-bronte-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-bronte-specs',
      v_id,
      '1.5mm',
      '16',
      '6.5 x 4.5mm',
      NULL,
      '2.8g',
      true
    )
    ON CONFLICT (ring_id) DO NOTHING;
  END IF;
END $$;