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

DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-aisha',
    'Aisha',
    'Aisha - Marquise 6 Claw Solitaire with Flat Cigar Band and Hidden Halo Engagement Ring',
    'Aisha is a modern take on the timeless 6-claw solitaire design featuring a breathtaking marquise cut centre stone, a sparkling hidden halo, and a flat, straight edged cigar band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'marquise'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-aisha';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-aisha-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/aisha/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/aisha/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-aisha-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/aisha/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/aisha/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-aisha-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/aisha/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/aisha/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-aisha-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-aisha-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-aisha-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-aisha-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-aisha-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-aisha-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-aisha-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-aisha-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-aisha-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-aisha-size-0', 1, v_id, 'D'),
      ('ring-aisha-size-1', 2, v_id, 'E'),
      ('ring-aisha-size-2', 3, v_id, 'F'),
      ('ring-aisha-size-3', 4, v_id, 'G'),
      ('ring-aisha-size-4', 5, v_id, 'H'),
      ('ring-aisha-size-5', 6, v_id, 'I'),
      ('ring-aisha-size-6', 7, v_id, 'J'),
      ('ring-aisha-size-7', 8, v_id, 'K'),
      ('ring-aisha-size-8', 9, v_id, 'L'),
      ('ring-aisha-size-9', 10, v_id, 'M'),
      ('ring-aisha-size-10', 11, v_id, 'N'),
      ('ring-aisha-size-11', 12, v_id, 'O'),
      ('ring-aisha-size-12', 13, v_id, 'P'),
      ('ring-aisha-size-13', 14, v_id, 'Q'),
      ('ring-aisha-size-14', 15, v_id, 'R'),
      ('ring-aisha-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-aisha-specs',
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
    'ring-alessia',
    'Alessia',
    'Alessia - Round Bezel Solitaire with Clustered Round-Marquise Mixed Set Shoulder Stones Engagement Ring',
    'Alessia features a round bezel-set centre stone complemented by round and marquise accents along the shoulders. A bold central form is balanced by gentle sparkle, resulting in a considered, contemporary design with layered detail. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'bezel'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-alessia';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-alessia-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alessia/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alessia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-alessia-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alessia/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alessia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-alessia-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alessia/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alessia/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alessia-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-alessia-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-alessia-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-alessia-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alessia-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-alessia-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alessia-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-alessia-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-alessia-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-alessia-size-0', 1, v_id, 'D'),
      ('ring-alessia-size-1', 2, v_id, 'E'),
      ('ring-alessia-size-2', 3, v_id, 'F'),
      ('ring-alessia-size-3', 4, v_id, 'G'),
      ('ring-alessia-size-4', 5, v_id, 'H'),
      ('ring-alessia-size-5', 6, v_id, 'I'),
      ('ring-alessia-size-6', 7, v_id, 'J'),
      ('ring-alessia-size-7', 8, v_id, 'K'),
      ('ring-alessia-size-8', 9, v_id, 'L'),
      ('ring-alessia-size-9', 10, v_id, 'M'),
      ('ring-alessia-size-10', 11, v_id, 'N'),
      ('ring-alessia-size-11', 12, v_id, 'O'),
      ('ring-alessia-size-12', 13, v_id, 'P'),
      ('ring-alessia-size-13', 14, v_id, 'Q'),
      ('ring-alessia-size-14', 15, v_id, 'R'),
      ('ring-alessia-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-alessia-specs',
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
    'ring-alex',
    'Alex',
    'Alex - Round 4 Claw Solitaire with Hidden Halo and Triple Pave Band Engagement Ring',
    'Alex is a beautiful round solitaire engagement ring with a sophisticated of a triple pavé band and hidden halo. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-alex';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-alex-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alex/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alex/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-alex-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alex/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alex/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-alex-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alex/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alex/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alex-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-alex-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-alex-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-alex-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alex-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-alex-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alex-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-alex-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-alex-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-alex-size-0', 1, v_id, 'D'),
      ('ring-alex-size-1', 2, v_id, 'E'),
      ('ring-alex-size-2', 3, v_id, 'F'),
      ('ring-alex-size-3', 4, v_id, 'G'),
      ('ring-alex-size-4', 5, v_id, 'H'),
      ('ring-alex-size-5', 6, v_id, 'I'),
      ('ring-alex-size-6', 7, v_id, 'J'),
      ('ring-alex-size-7', 8, v_id, 'K'),
      ('ring-alex-size-8', 9, v_id, 'L'),
      ('ring-alex-size-9', 10, v_id, 'M'),
      ('ring-alex-size-10', 11, v_id, 'N'),
      ('ring-alex-size-11', 12, v_id, 'O'),
      ('ring-alex-size-12', 13, v_id, 'P'),
      ('ring-alex-size-13', 14, v_id, 'Q'),
      ('ring-alex-size-14', 15, v_id, 'R'),
      ('ring-alex-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-alex-specs',
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
    'ring-alexandria',
    'Alexandria',
    'Alexandria - Round 6 Claw Solitaire with Pave Band Engagement Ring',
    'Alexandria is a signature 6-claw solitaire design featuring a round cut centre stone and 2/3 pavé band. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-alexandria';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-alexandria-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alexandria/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alexandria/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-alexandria-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alexandria/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alexandria/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-alexandria-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alexandria/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alexandria/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alexandria-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-alexandria-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-alexandria-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-alexandria-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alexandria-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-alexandria-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alexandria-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-alexandria-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-alexandria-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-alexandria-size-0', 1, v_id, 'D'),
      ('ring-alexandria-size-1', 2, v_id, 'E'),
      ('ring-alexandria-size-2', 3, v_id, 'F'),
      ('ring-alexandria-size-3', 4, v_id, 'G'),
      ('ring-alexandria-size-4', 5, v_id, 'H'),
      ('ring-alexandria-size-5', 6, v_id, 'I'),
      ('ring-alexandria-size-6', 7, v_id, 'J'),
      ('ring-alexandria-size-7', 8, v_id, 'K'),
      ('ring-alexandria-size-8', 9, v_id, 'L'),
      ('ring-alexandria-size-9', 10, v_id, 'M'),
      ('ring-alexandria-size-10', 11, v_id, 'N'),
      ('ring-alexandria-size-11', 12, v_id, 'O'),
      ('ring-alexandria-size-12', 13, v_id, 'P'),
      ('ring-alexandria-size-13', 14, v_id, 'Q'),
      ('ring-alexandria-size-14', 15, v_id, 'R'),
      ('ring-alexandria-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-alexandria-specs',
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
    'ring-alexia',
    'Alexia',
    'Alexia - Oval 4 Claw Trilogy with Pear Side Stones and Cathedral Setting Engagement Ring',
    'The Alexia trilogy ring features a striking oval centre stone and two pear cut side stones seated within a cathedral setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'trilogy'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-alexia';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-alexia-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alexia/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alexia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-alexia-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alexia/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alexia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-alexia-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alexia/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alexia/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alexia-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-alexia-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-alexia-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-alexia-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alexia-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-alexia-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alexia-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-alexia-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-alexia-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-alexia-size-0', 1, v_id, 'D'),
      ('ring-alexia-size-1', 2, v_id, 'E'),
      ('ring-alexia-size-2', 3, v_id, 'F'),
      ('ring-alexia-size-3', 4, v_id, 'G'),
      ('ring-alexia-size-4', 5, v_id, 'H'),
      ('ring-alexia-size-5', 6, v_id, 'I'),
      ('ring-alexia-size-6', 7, v_id, 'J'),
      ('ring-alexia-size-7', 8, v_id, 'K'),
      ('ring-alexia-size-8', 9, v_id, 'L'),
      ('ring-alexia-size-9', 10, v_id, 'M'),
      ('ring-alexia-size-10', 11, v_id, 'N'),
      ('ring-alexia-size-11', 12, v_id, 'O'),
      ('ring-alexia-size-12', 13, v_id, 'P'),
      ('ring-alexia-size-13', 14, v_id, 'Q'),
      ('ring-alexia-size-14', 15, v_id, 'R'),
      ('ring-alexia-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-alexia-specs',
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
    'ring-alia',
    'Alia',
    'Alia - Pear 5 Claw Solitaire Engagement Ring',
    'Minimal in design, the Alia engagement ring boasts a stunning pear cut centre stone framed by five eagle-tipped claws. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'pear'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-alia';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-alia-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alia/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-alia-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alia/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-alia-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alia/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alia/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alia-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-alia-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-alia-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-alia-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alia-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-alia-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alia-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-alia-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-alia-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-alia-size-0', 1, v_id, 'D'),
      ('ring-alia-size-1', 2, v_id, 'E'),
      ('ring-alia-size-2', 3, v_id, 'F'),
      ('ring-alia-size-3', 4, v_id, 'G'),
      ('ring-alia-size-4', 5, v_id, 'H'),
      ('ring-alia-size-5', 6, v_id, 'I'),
      ('ring-alia-size-6', 7, v_id, 'J'),
      ('ring-alia-size-7', 8, v_id, 'K'),
      ('ring-alia-size-8', 9, v_id, 'L'),
      ('ring-alia-size-9', 10, v_id, 'M'),
      ('ring-alia-size-10', 11, v_id, 'N'),
      ('ring-alia-size-11', 12, v_id, 'O'),
      ('ring-alia-size-12', 13, v_id, 'P'),
      ('ring-alia-size-13', 14, v_id, 'Q'),
      ('ring-alia-size-14', 15, v_id, 'R'),
      ('ring-alia-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-alia-specs',
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
    'ring-alice',
    'Alice',
    'Alice - Emerald 4 Claw Solitaire with Hidden Halo Engagement Ring',
    'The Alice engagement ring features a bold emerald solitaire and sparkling hidden halo seated atop a minimal band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'emerald'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-alice';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-alice-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alice/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alice/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-alice-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alice/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alice/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-alice-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alice/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alice/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alice-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-alice-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-alice-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-alice-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alice-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-alice-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alice-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-alice-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-alice-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-alice-size-0', 1, v_id, 'D'),
      ('ring-alice-size-1', 2, v_id, 'E'),
      ('ring-alice-size-2', 3, v_id, 'F'),
      ('ring-alice-size-3', 4, v_id, 'G'),
      ('ring-alice-size-4', 5, v_id, 'H'),
      ('ring-alice-size-5', 6, v_id, 'I'),
      ('ring-alice-size-6', 7, v_id, 'J'),
      ('ring-alice-size-7', 8, v_id, 'K'),
      ('ring-alice-size-8', 9, v_id, 'L'),
      ('ring-alice-size-9', 10, v_id, 'M'),
      ('ring-alice-size-10', 11, v_id, 'N'),
      ('ring-alice-size-11', 12, v_id, 'O'),
      ('ring-alice-size-12', 13, v_id, 'P'),
      ('ring-alice-size-13', 14, v_id, 'Q'),
      ('ring-alice-size-14', 15, v_id, 'R'),
      ('ring-alice-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-alice-specs',
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
    'ring-alina',
    'Alina',
    'Alina - Emerald 4 Claw Solitaire Engagement Ring',
    'Alina is a classic emerald solitaire engagement ring held within four eagle-tipped claws and seated atop a sleek band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'emerald'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-alina';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-alina-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alina/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alina/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-alina-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alina/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alina/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-alina-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alina/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alina/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alina-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-alina-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-alina-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-alina-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alina-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-alina-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alina-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-alina-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-alina-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-alina-size-0', 1, v_id, 'D'),
      ('ring-alina-size-1', 2, v_id, 'E'),
      ('ring-alina-size-2', 3, v_id, 'F'),
      ('ring-alina-size-3', 4, v_id, 'G'),
      ('ring-alina-size-4', 5, v_id, 'H'),
      ('ring-alina-size-5', 6, v_id, 'I'),
      ('ring-alina-size-6', 7, v_id, 'J'),
      ('ring-alina-size-7', 8, v_id, 'K'),
      ('ring-alina-size-8', 9, v_id, 'L'),
      ('ring-alina-size-9', 10, v_id, 'M'),
      ('ring-alina-size-10', 11, v_id, 'N'),
      ('ring-alina-size-11', 12, v_id, 'O'),
      ('ring-alina-size-12', 13, v_id, 'P'),
      ('ring-alina-size-13', 14, v_id, 'Q'),
      ('ring-alina-size-14', 15, v_id, 'R'),
      ('ring-alina-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-alina-specs',
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
    'ring-allison',
    'Allison',
    'Allison - Oval 6 Claw Solitaire with East West Setting Engagement Ring',
    'The Allison engagement ring adds a contemporary twist to a classic design with a beautiful east-to-west oval cut centre stone and 6-claw setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'east_west'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-allison';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-allison-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/allison/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/allison/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-allison-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/allison/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/allison/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-allison-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/allison/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/allison/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-allison-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-allison-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-allison-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-allison-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-allison-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-allison-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-allison-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-allison-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-allison-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-allison-size-0', 1, v_id, 'D'),
      ('ring-allison-size-1', 2, v_id, 'E'),
      ('ring-allison-size-2', 3, v_id, 'F'),
      ('ring-allison-size-3', 4, v_id, 'G'),
      ('ring-allison-size-4', 5, v_id, 'H'),
      ('ring-allison-size-5', 6, v_id, 'I'),
      ('ring-allison-size-6', 7, v_id, 'J'),
      ('ring-allison-size-7', 8, v_id, 'K'),
      ('ring-allison-size-8', 9, v_id, 'L'),
      ('ring-allison-size-9', 10, v_id, 'M'),
      ('ring-allison-size-10', 11, v_id, 'N'),
      ('ring-allison-size-11', 12, v_id, 'O'),
      ('ring-allison-size-12', 13, v_id, 'P'),
      ('ring-allison-size-13', 14, v_id, 'Q'),
      ('ring-allison-size-14', 15, v_id, 'R'),
      ('ring-allison-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-allison-specs',
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
    'ring-alyssa',
    'Alyssa',
    'Alyssa - Oval 4 Claw Solitaire with Marquise and Round Accent Stones Engagement Ring',
    'The popular Alyssa design presents a stunning oval cut centre stone and a sleek band featuring two pairs of round and marquise cut side stones. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'accents'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-alyssa';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-alyssa-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alyssa/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alyssa/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-alyssa-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alyssa/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alyssa/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-alyssa-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alyssa/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alyssa/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alyssa-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-alyssa-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-alyssa-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-alyssa-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alyssa-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-alyssa-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alyssa-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-alyssa-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-alyssa-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-alyssa-size-0', 1, v_id, 'D'),
      ('ring-alyssa-size-1', 2, v_id, 'E'),
      ('ring-alyssa-size-2', 3, v_id, 'F'),
      ('ring-alyssa-size-3', 4, v_id, 'G'),
      ('ring-alyssa-size-4', 5, v_id, 'H'),
      ('ring-alyssa-size-5', 6, v_id, 'I'),
      ('ring-alyssa-size-6', 7, v_id, 'J'),
      ('ring-alyssa-size-7', 8, v_id, 'K'),
      ('ring-alyssa-size-8', 9, v_id, 'L'),
      ('ring-alyssa-size-9', 10, v_id, 'M'),
      ('ring-alyssa-size-10', 11, v_id, 'N'),
      ('ring-alyssa-size-11', 12, v_id, 'O'),
      ('ring-alyssa-size-12', 13, v_id, 'P'),
      ('ring-alyssa-size-13', 14, v_id, 'Q'),
      ('ring-alyssa-size-14', 15, v_id, 'R'),
      ('ring-alyssa-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-alyssa-specs',
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
    'ring-amanda',
    'Amanda',
    'Amanda - Round 6 Claw Solitaire with Wrap Around Hidden Halo and Pave Band Engagement Ring',
    'Amanda''s elegant design boasts a 6-claw round solitaire, wrap-around hidden halo and 2/3 pavé band. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-amanda';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-amanda-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/amanda/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/amanda/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-amanda-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/amanda/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/amanda/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-amanda-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/amanda/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/amanda/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-amanda-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-amanda-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-amanda-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-amanda-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-amanda-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-amanda-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-amanda-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-amanda-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-amanda-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-amanda-size-0', 1, v_id, 'D'),
      ('ring-amanda-size-1', 2, v_id, 'E'),
      ('ring-amanda-size-2', 3, v_id, 'F'),
      ('ring-amanda-size-3', 4, v_id, 'G'),
      ('ring-amanda-size-4', 5, v_id, 'H'),
      ('ring-amanda-size-5', 6, v_id, 'I'),
      ('ring-amanda-size-6', 7, v_id, 'J'),
      ('ring-amanda-size-7', 8, v_id, 'K'),
      ('ring-amanda-size-8', 9, v_id, 'L'),
      ('ring-amanda-size-9', 10, v_id, 'M'),
      ('ring-amanda-size-10', 11, v_id, 'N'),
      ('ring-amanda-size-11', 12, v_id, 'O'),
      ('ring-amanda-size-12', 13, v_id, 'P'),
      ('ring-amanda-size-13', 14, v_id, 'Q'),
      ('ring-amanda-size-14', 15, v_id, 'R'),
      ('ring-amanda-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-amanda-specs',
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
    'ring-amor',
    'Amor',
    'Amor - Pear and Emerald Claw Toi et Moi Engagement Ring',
    'The Amor toi et moi engagement ring presents the striking balance between a pear and emerald cut stone, emphasised by a sleek and minimal band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'emerald'::enum_ring_shape,
    'toi_et_moi'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-amor';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-amor-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/amor/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/amor/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-amor-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/amor/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/amor/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-amor-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/amor/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/amor/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-amor-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-amor-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-amor-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-amor-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-amor-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-amor-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-amor-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-amor-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-amor-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-amor-size-0', 1, v_id, 'D'),
      ('ring-amor-size-1', 2, v_id, 'E'),
      ('ring-amor-size-2', 3, v_id, 'F'),
      ('ring-amor-size-3', 4, v_id, 'G'),
      ('ring-amor-size-4', 5, v_id, 'H'),
      ('ring-amor-size-5', 6, v_id, 'I'),
      ('ring-amor-size-6', 7, v_id, 'J'),
      ('ring-amor-size-7', 8, v_id, 'K'),
      ('ring-amor-size-8', 9, v_id, 'L'),
      ('ring-amor-size-9', 10, v_id, 'M'),
      ('ring-amor-size-10', 11, v_id, 'N'),
      ('ring-amor-size-11', 12, v_id, 'O'),
      ('ring-amor-size-12', 13, v_id, 'P'),
      ('ring-amor-size-13', 14, v_id, 'Q'),
      ('ring-amor-size-14', 15, v_id, 'R'),
      ('ring-amor-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-amor-specs',
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
    'ring-amy',
    'Amy',
    'Amy – 3 Claw Pear Solitaire',
    'Minimal and classic, Amy is a signature 3-claw pear solitaire engagement ring. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'pear'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-amy';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-amy-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/amy/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/amy/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-amy-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/amy/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/amy/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-amy-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/amy/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/amy/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-amy-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-amy-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-amy-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-amy-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-amy-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-amy-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-amy-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-amy-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-amy-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-amy-size-0', 1, v_id, 'D'),
      ('ring-amy-size-1', 2, v_id, 'E'),
      ('ring-amy-size-2', 3, v_id, 'F'),
      ('ring-amy-size-3', 4, v_id, 'G'),
      ('ring-amy-size-4', 5, v_id, 'H'),
      ('ring-amy-size-5', 6, v_id, 'I'),
      ('ring-amy-size-6', 7, v_id, 'J'),
      ('ring-amy-size-7', 8, v_id, 'K'),
      ('ring-amy-size-8', 9, v_id, 'L'),
      ('ring-amy-size-9', 10, v_id, 'M'),
      ('ring-amy-size-10', 11, v_id, 'N'),
      ('ring-amy-size-11', 12, v_id, 'O'),
      ('ring-amy-size-12', 13, v_id, 'P'),
      ('ring-amy-size-13', 14, v_id, 'Q'),
      ('ring-amy-size-14', 15, v_id, 'R'),
      ('ring-amy-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-amy-specs',
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
    'ring-analyce',
    'Analyce',
    'Analyce - Emerald 4 Claw Solitaire with Halo and Pave Band Engagement Ring',
    'The Analyce engagement ring is a glamorous emerald halo design complete with a 2/3 pavé band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'emerald'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-analyce';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-analyce-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/analyce/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/analyce/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-analyce-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/analyce/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/analyce/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-analyce-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/analyce/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/analyce/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-analyce-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-analyce-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-analyce-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-analyce-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-analyce-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-analyce-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-analyce-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-analyce-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-analyce-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-analyce-size-0', 1, v_id, 'D'),
      ('ring-analyce-size-1', 2, v_id, 'E'),
      ('ring-analyce-size-2', 3, v_id, 'F'),
      ('ring-analyce-size-3', 4, v_id, 'G'),
      ('ring-analyce-size-4', 5, v_id, 'H'),
      ('ring-analyce-size-5', 6, v_id, 'I'),
      ('ring-analyce-size-6', 7, v_id, 'J'),
      ('ring-analyce-size-7', 8, v_id, 'K'),
      ('ring-analyce-size-8', 9, v_id, 'L'),
      ('ring-analyce-size-9', 10, v_id, 'M'),
      ('ring-analyce-size-10', 11, v_id, 'N'),
      ('ring-analyce-size-11', 12, v_id, 'O'),
      ('ring-analyce-size-12', 13, v_id, 'P'),
      ('ring-analyce-size-13', 14, v_id, 'Q'),
      ('ring-analyce-size-14', 15, v_id, 'R'),
      ('ring-analyce-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-analyce-specs',
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
    'ring-angelina',
    'Angelina',
    'Angelina - Radiant 4 Claw Solitaire with Cigar Band and Hidden Halo Engagement Ring',
    'The Angelina engagement ring adds a boldness to the traditional 4-claw radiant solitaire design with a striking cigar band and sparkling hidden halo. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-angelina';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-angelina-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/angelina/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/angelina/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-angelina-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/angelina/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/angelina/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-angelina-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/angelina/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/angelina/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-angelina-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-angelina-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-angelina-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-angelina-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-angelina-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-angelina-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-angelina-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-angelina-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-angelina-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-angelina-size-0', 1, v_id, 'D'),
      ('ring-angelina-size-1', 2, v_id, 'E'),
      ('ring-angelina-size-2', 3, v_id, 'F'),
      ('ring-angelina-size-3', 4, v_id, 'G'),
      ('ring-angelina-size-4', 5, v_id, 'H'),
      ('ring-angelina-size-5', 6, v_id, 'I'),
      ('ring-angelina-size-6', 7, v_id, 'J'),
      ('ring-angelina-size-7', 8, v_id, 'K'),
      ('ring-angelina-size-8', 9, v_id, 'L'),
      ('ring-angelina-size-9', 10, v_id, 'M'),
      ('ring-angelina-size-10', 11, v_id, 'N'),
      ('ring-angelina-size-11', 12, v_id, 'O'),
      ('ring-angelina-size-12', 13, v_id, 'P'),
      ('ring-angelina-size-13', 14, v_id, 'Q'),
      ('ring-angelina-size-14', 15, v_id, 'R'),
      ('ring-angelina-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-angelina-specs',
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
    'ring-anna',
    'Anna',
    'Anna - Round 6 Claw Solitaire with Hidden Halo Engagement Ring',
    'Anna is a classic round solitaire design with the added feature of six eagle-tipped claws and a sparkling hidden halo. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-anna';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-anna-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/anna/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/anna/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-anna-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/anna/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/anna/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-anna-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/anna/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/anna/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-anna-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-anna-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-anna-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-anna-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-anna-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-anna-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-anna-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-anna-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-anna-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-anna-size-0', 1, v_id, 'D'),
      ('ring-anna-size-1', 2, v_id, 'E'),
      ('ring-anna-size-2', 3, v_id, 'F'),
      ('ring-anna-size-3', 4, v_id, 'G'),
      ('ring-anna-size-4', 5, v_id, 'H'),
      ('ring-anna-size-5', 6, v_id, 'I'),
      ('ring-anna-size-6', 7, v_id, 'J'),
      ('ring-anna-size-7', 8, v_id, 'K'),
      ('ring-anna-size-8', 9, v_id, 'L'),
      ('ring-anna-size-9', 10, v_id, 'M'),
      ('ring-anna-size-10', 11, v_id, 'N'),
      ('ring-anna-size-11', 12, v_id, 'O'),
      ('ring-anna-size-12', 13, v_id, 'P'),
      ('ring-anna-size-13', 14, v_id, 'Q'),
      ('ring-anna-size-14', 15, v_id, 'R'),
      ('ring-anna-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-anna-specs',
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
    'ring-annika',
    'Annika',
    'Annika - Elongated Cushion 4 Claw Solitaire with Hidden Halo, Pave Band and Cathedral Setting Engagement Ring',
    'Annika is a stunning 4-claw elongated cushion solitaire engagement ring complete with a hidden halo, cathedral setting and 2/3 pavé band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_cushion'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-annika';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-annika-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/annika/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/annika/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-annika-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/annika/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/annika/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-annika-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/annika/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/annika/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-annika-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-annika-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-annika-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-annika-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-annika-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-annika-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-annika-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-annika-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-annika-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-annika-size-0', 1, v_id, 'D'),
      ('ring-annika-size-1', 2, v_id, 'E'),
      ('ring-annika-size-2', 3, v_id, 'F'),
      ('ring-annika-size-3', 4, v_id, 'G'),
      ('ring-annika-size-4', 5, v_id, 'H'),
      ('ring-annika-size-5', 6, v_id, 'I'),
      ('ring-annika-size-6', 7, v_id, 'J'),
      ('ring-annika-size-7', 8, v_id, 'K'),
      ('ring-annika-size-8', 9, v_id, 'L'),
      ('ring-annika-size-9', 10, v_id, 'M'),
      ('ring-annika-size-10', 11, v_id, 'N'),
      ('ring-annika-size-11', 12, v_id, 'O'),
      ('ring-annika-size-12', 13, v_id, 'P'),
      ('ring-annika-size-13', 14, v_id, 'Q'),
      ('ring-annika-size-14', 15, v_id, 'R'),
      ('ring-annika-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-annika-specs',
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
    'ring-annie',
    'Annie',
    'Annie - Princess 4 Claw Solitaire with Hidden Halo and Pave Band Engagement Ring',
    'The Annie engagement ring is a dazzling princess solitaire design complemented by four eagle-tipped claws, a hidden halo and 2/3 pavé band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'princess'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-annie';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-annie-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/annie/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/annie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-annie-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/annie/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/annie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-annie-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/annie/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/annie/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-annie-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-annie-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-annie-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-annie-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-annie-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-annie-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-annie-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-annie-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-annie-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-annie-size-0', 1, v_id, 'D'),
      ('ring-annie-size-1', 2, v_id, 'E'),
      ('ring-annie-size-2', 3, v_id, 'F'),
      ('ring-annie-size-3', 4, v_id, 'G'),
      ('ring-annie-size-4', 5, v_id, 'H'),
      ('ring-annie-size-5', 6, v_id, 'I'),
      ('ring-annie-size-6', 7, v_id, 'J'),
      ('ring-annie-size-7', 8, v_id, 'K'),
      ('ring-annie-size-8', 9, v_id, 'L'),
      ('ring-annie-size-9', 10, v_id, 'M'),
      ('ring-annie-size-10', 11, v_id, 'N'),
      ('ring-annie-size-11', 12, v_id, 'O'),
      ('ring-annie-size-12', 13, v_id, 'P'),
      ('ring-annie-size-13', 14, v_id, 'Q'),
      ('ring-annie-size-14', 15, v_id, 'R'),
      ('ring-annie-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-annie-specs',
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
    'ring-arabella',
    'Arabella',
    'Arabella - Oval 4 Claw Trilogy with Pear Side Stones and Pave Band Engagement Ring',
    'Arabella''s sweeping cathedral setting showcases an oval cut centre stone and two pear cut side stones atop a 2/3 pavé band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'trilogy'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-arabella';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-arabella-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/arabella/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/arabella/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-arabella-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/arabella/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/arabella/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-arabella-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/arabella/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/arabella/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-arabella-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-arabella-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-arabella-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-arabella-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-arabella-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-arabella-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-arabella-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-arabella-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-arabella-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-arabella-size-0', 1, v_id, 'D'),
      ('ring-arabella-size-1', 2, v_id, 'E'),
      ('ring-arabella-size-2', 3, v_id, 'F'),
      ('ring-arabella-size-3', 4, v_id, 'G'),
      ('ring-arabella-size-4', 5, v_id, 'H'),
      ('ring-arabella-size-5', 6, v_id, 'I'),
      ('ring-arabella-size-6', 7, v_id, 'J'),
      ('ring-arabella-size-7', 8, v_id, 'K'),
      ('ring-arabella-size-8', 9, v_id, 'L'),
      ('ring-arabella-size-9', 10, v_id, 'M'),
      ('ring-arabella-size-10', 11, v_id, 'N'),
      ('ring-arabella-size-11', 12, v_id, 'O'),
      ('ring-arabella-size-12', 13, v_id, 'P'),
      ('ring-arabella-size-13', 14, v_id, 'Q'),
      ('ring-arabella-size-14', 15, v_id, 'R'),
      ('ring-arabella-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-arabella-specs',
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
    'ring-ari',
    'Ari',
    'Ari - Radiant 4 Claw Solitaire with Hidden Halo, Tapered Band and Cathedral Setting Engagement Ring',
    'Ari is an elegant radiant solitaire design with a beautiful cathedral setting and sparkling hidden halo. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-ari';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-ari-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ari/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ari/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-ari-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ari/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ari/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-ari-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ari/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ari/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ari-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-ari-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-ari-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-ari-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ari-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-ari-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ari-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-ari-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-ari-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-ari-size-0', 1, v_id, 'D'),
      ('ring-ari-size-1', 2, v_id, 'E'),
      ('ring-ari-size-2', 3, v_id, 'F'),
      ('ring-ari-size-3', 4, v_id, 'G'),
      ('ring-ari-size-4', 5, v_id, 'H'),
      ('ring-ari-size-5', 6, v_id, 'I'),
      ('ring-ari-size-6', 7, v_id, 'J'),
      ('ring-ari-size-7', 8, v_id, 'K'),
      ('ring-ari-size-8', 9, v_id, 'L'),
      ('ring-ari-size-9', 10, v_id, 'M'),
      ('ring-ari-size-10', 11, v_id, 'N'),
      ('ring-ari-size-11', 12, v_id, 'O'),
      ('ring-ari-size-12', 13, v_id, 'P'),
      ('ring-ari-size-13', 14, v_id, 'Q'),
      ('ring-ari-size-14', 15, v_id, 'R'),
      ('ring-ari-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-ari-specs',
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

