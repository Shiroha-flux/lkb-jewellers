DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-adelyn',
    'Adelyn',
    'Adelyn - Round 4 Claw Trilogy with Pear Side Stones and Open Trellis Gallery Engagement Ring',
    'Adelyn is a timeless trilogy design featuring a beautiful round centre stone and two pear cut side stones seated within a trellis setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'trilogy'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-adelyn';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-adelyn-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/adelyn/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/adelyn/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-adelyn-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/adelyn/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/adelyn/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-adelyn-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/adelyn/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/adelyn/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-adelyn-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-adelyn-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-adelyn-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-adelyn-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-adelyn-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-adelyn-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-adelyn-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-adelyn-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-adelyn-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-adelyn-size-0', 1, v_id, 'D'),
      ('ring-adelyn-size-1', 2, v_id, 'E'),
      ('ring-adelyn-size-2', 3, v_id, 'F'),
      ('ring-adelyn-size-3', 4, v_id, 'G'),
      ('ring-adelyn-size-4', 5, v_id, 'H'),
      ('ring-adelyn-size-5', 6, v_id, 'I'),
      ('ring-adelyn-size-6', 7, v_id, 'J'),
      ('ring-adelyn-size-7', 8, v_id, 'K'),
      ('ring-adelyn-size-8', 9, v_id, 'L'),
      ('ring-adelyn-size-9', 10, v_id, 'M'),
      ('ring-adelyn-size-10', 11, v_id, 'N'),
      ('ring-adelyn-size-11', 12, v_id, 'O'),
      ('ring-adelyn-size-12', 13, v_id, 'P'),
      ('ring-adelyn-size-13', 14, v_id, 'Q'),
      ('ring-adelyn-size-14', 15, v_id, 'R'),
      ('ring-adelyn-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-adelyn-specs',
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
    'ring-adina',
    'Adina',
    'Adina - Radiant 4 Claw Solitaire with Hidden Halo and Floating Cathedral Low Setting Engagement Ring',
    'Adina is a modern solitaire that doesn''t ask you to choose between beauty and practicality. Featuring a low-set radiant centre stone, its open bridge and hidden halo create a graceful floating effect, allowing the design to sit low on the finger while pairing seamlessly flush with a matching wedding band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'radiant'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'low_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-adina';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-adina-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/adina/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/adina/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-adina-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/adina/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/adina/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-adina-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/adina/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/adina/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-adina-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-adina-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-adina-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-adina-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-adina-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-adina-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-adina-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-adina-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-adina-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-adina-size-0', 1, v_id, 'D'),
      ('ring-adina-size-1', 2, v_id, 'E'),
      ('ring-adina-size-2', 3, v_id, 'F'),
      ('ring-adina-size-3', 4, v_id, 'G'),
      ('ring-adina-size-4', 5, v_id, 'H'),
      ('ring-adina-size-5', 6, v_id, 'I'),
      ('ring-adina-size-6', 7, v_id, 'J'),
      ('ring-adina-size-7', 8, v_id, 'K'),
      ('ring-adina-size-8', 9, v_id, 'L'),
      ('ring-adina-size-9', 10, v_id, 'M'),
      ('ring-adina-size-10', 11, v_id, 'N'),
      ('ring-adina-size-11', 12, v_id, 'O'),
      ('ring-adina-size-12', 13, v_id, 'P'),
      ('ring-adina-size-13', 14, v_id, 'Q'),
      ('ring-adina-size-14', 15, v_id, 'R'),
      ('ring-adina-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-adina-specs',
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
    'ring-adrian',
    'Adrian',
    'Adrian - Statement Emerald East West Bezel Solitaire with Flat Cigar Band Engagement Ring',
    'Adrian is an east–west set emerald-cut centre stone enclosed within a statement bezel. The design flows into a flat-profile cigar band, creating clean lines and a modern, bold composition. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'emerald'::enum_ring_shape,
    'bezel'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-adrian';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-adrian-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/adrian/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/adrian/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-adrian-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/adrian/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/adrian/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-adrian-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/adrian/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/adrian/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-adrian-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-adrian-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-adrian-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-adrian-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-adrian-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-adrian-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-adrian-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-adrian-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-adrian-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-adrian-size-0', 1, v_id, 'D'),
      ('ring-adrian-size-1', 2, v_id, 'E'),
      ('ring-adrian-size-2', 3, v_id, 'F'),
      ('ring-adrian-size-3', 4, v_id, 'G'),
      ('ring-adrian-size-4', 5, v_id, 'H'),
      ('ring-adrian-size-5', 6, v_id, 'I'),
      ('ring-adrian-size-6', 7, v_id, 'J'),
      ('ring-adrian-size-7', 8, v_id, 'K'),
      ('ring-adrian-size-8', 9, v_id, 'L'),
      ('ring-adrian-size-9', 10, v_id, 'M'),
      ('ring-adrian-size-10', 11, v_id, 'N'),
      ('ring-adrian-size-11', 12, v_id, 'O'),
      ('ring-adrian-size-12', 13, v_id, 'P'),
      ('ring-adrian-size-13', 14, v_id, 'Q'),
      ('ring-adrian-size-14', 15, v_id, 'R'),
      ('ring-adrian-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-adrian-specs',
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
    'ring-aida',
    'Aida',
    'Aida - Radiant 4 Claw Solitaire with Flat Cigar Band and Hidden Halo Engagement Ring',
    'Aida is a modern interpretation of the four-claw radiant-cut solitaire, set on a flat, straight-edged cigar band. A discreet hidden halo adds subtle brilliance, allowing the design’s width and presence to take focus. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'radiant'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-aida';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-aida-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/aida/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/aida/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-aida-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/aida/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/aida/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-aida-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/aida/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/aida/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-aida-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-aida-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-aida-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-aida-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-aida-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-aida-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-aida-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-aida-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-aida-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-aida-size-0', 1, v_id, 'D'),
      ('ring-aida-size-1', 2, v_id, 'E'),
      ('ring-aida-size-2', 3, v_id, 'F'),
      ('ring-aida-size-3', 4, v_id, 'G'),
      ('ring-aida-size-4', 5, v_id, 'H'),
      ('ring-aida-size-5', 6, v_id, 'I'),
      ('ring-aida-size-6', 7, v_id, 'J'),
      ('ring-aida-size-7', 8, v_id, 'K'),
      ('ring-aida-size-8', 9, v_id, 'L'),
      ('ring-aida-size-9', 10, v_id, 'M'),
      ('ring-aida-size-10', 11, v_id, 'N'),
      ('ring-aida-size-11', 12, v_id, 'O'),
      ('ring-aida-size-12', 13, v_id, 'P'),
      ('ring-aida-size-13', 14, v_id, 'Q'),
      ('ring-aida-size-14', 15, v_id, 'R'),
      ('ring-aida-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-aida-specs',
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
    'ring-ainsley',
    'Ainsley',
    'Ainsley - Pear 5 Claw Solitaire with Wrap Around Hidden Halo Engagement Ring',
    'The Ainsley engagement ring is a high-set pear solitaire design with five eagle-tipped claws and a wrap-around hidden halo. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-ainsley';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-ainsley-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ainsley/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ainsley/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-ainsley-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ainsley/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ainsley/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-ainsley-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ainsley/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ainsley/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ainsley-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-ainsley-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-ainsley-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-ainsley-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ainsley-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-ainsley-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ainsley-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-ainsley-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-ainsley-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-ainsley-size-0', 1, v_id, 'D'),
      ('ring-ainsley-size-1', 2, v_id, 'E'),
      ('ring-ainsley-size-2', 3, v_id, 'F'),
      ('ring-ainsley-size-3', 4, v_id, 'G'),
      ('ring-ainsley-size-4', 5, v_id, 'H'),
      ('ring-ainsley-size-5', 6, v_id, 'I'),
      ('ring-ainsley-size-6', 7, v_id, 'J'),
      ('ring-ainsley-size-7', 8, v_id, 'K'),
      ('ring-ainsley-size-8', 9, v_id, 'L'),
      ('ring-ainsley-size-9', 10, v_id, 'M'),
      ('ring-ainsley-size-10', 11, v_id, 'N'),
      ('ring-ainsley-size-11', 12, v_id, 'O'),
      ('ring-ainsley-size-12', 13, v_id, 'P'),
      ('ring-ainsley-size-13', 14, v_id, 'Q'),
      ('ring-ainsley-size-14', 15, v_id, 'R'),
      ('ring-ainsley-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-ainsley-specs',
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