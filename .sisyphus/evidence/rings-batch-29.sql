DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-luna',
    'Luna',
    'Luna - Round 4 Claw Solitaire with Hidden Halo and Floating Cathedral Low Setting Engagement Ring',
    'Luna is a modern solitaire that doesn''t ask you to choose between beauty and practicality. Featuring a low-set round centre stone, its open bridge and hidden halo create a graceful floating effect, allowing the design to sit low on the finger while pairing seamlessly flush with a matching wedding band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'low_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-luna';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-luna-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/luna/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/luna/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-luna-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/luna/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/luna/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-luna-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/luna/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/luna/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-luna-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-luna-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-luna-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-luna-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-luna-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-luna-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-luna-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-luna-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-luna-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-luna-size-0', 1, v_id, 'D'),
      ('ring-luna-size-1', 2, v_id, 'E'),
      ('ring-luna-size-2', 3, v_id, 'F'),
      ('ring-luna-size-3', 4, v_id, 'G'),
      ('ring-luna-size-4', 5, v_id, 'H'),
      ('ring-luna-size-5', 6, v_id, 'I'),
      ('ring-luna-size-6', 7, v_id, 'J'),
      ('ring-luna-size-7', 8, v_id, 'K'),
      ('ring-luna-size-8', 9, v_id, 'L'),
      ('ring-luna-size-9', 10, v_id, 'M'),
      ('ring-luna-size-10', 11, v_id, 'N'),
      ('ring-luna-size-11', 12, v_id, 'O'),
      ('ring-luna-size-12', 13, v_id, 'P'),
      ('ring-luna-size-13', 14, v_id, 'Q'),
      ('ring-luna-size-14', 15, v_id, 'R'),
      ('ring-luna-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-luna-specs',
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
    'ring-mabeline',
    'Mabeline',
    'Mabeline - Oval 4 Claw Solitaire with East West Setting and Raised Basket Gallery Engagement Ring',
    'Mabeline is a sleek east-west design featuring a stunning oval cut centre stone placed horizontally in a low-set 4-claw basket setting. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-mabeline';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-mabeline-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/mabeline/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/mabeline/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-mabeline-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/mabeline/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/mabeline/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-mabeline-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/mabeline/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/mabeline/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-mabeline-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-mabeline-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-mabeline-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-mabeline-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-mabeline-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-mabeline-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-mabeline-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-mabeline-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-mabeline-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-mabeline-size-0', 1, v_id, 'D'),
      ('ring-mabeline-size-1', 2, v_id, 'E'),
      ('ring-mabeline-size-2', 3, v_id, 'F'),
      ('ring-mabeline-size-3', 4, v_id, 'G'),
      ('ring-mabeline-size-4', 5, v_id, 'H'),
      ('ring-mabeline-size-5', 6, v_id, 'I'),
      ('ring-mabeline-size-6', 7, v_id, 'J'),
      ('ring-mabeline-size-7', 8, v_id, 'K'),
      ('ring-mabeline-size-8', 9, v_id, 'L'),
      ('ring-mabeline-size-9', 10, v_id, 'M'),
      ('ring-mabeline-size-10', 11, v_id, 'N'),
      ('ring-mabeline-size-11', 12, v_id, 'O'),
      ('ring-mabeline-size-12', 13, v_id, 'P'),
      ('ring-mabeline-size-13', 14, v_id, 'Q'),
      ('ring-mabeline-size-14', 15, v_id, 'R'),
      ('ring-mabeline-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-mabeline-specs',
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
    'ring-madeline',
    'Madeline',
    'Madeline - Pear 5 Claw Solitaire with Halo and Pave Band and Cathedral Setting Engagement Ring',
    'The Madeline engagement ring is an elegant pear halo design featuring five eagle-tipped claws, basket setting and 2/3 pavé band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'pear'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-madeline';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-madeline-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/madeline/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/madeline/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-madeline-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/madeline/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/madeline/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-madeline-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/madeline/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/madeline/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-madeline-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-madeline-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-madeline-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-madeline-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-madeline-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-madeline-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-madeline-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-madeline-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-madeline-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-madeline-size-0', 1, v_id, 'D'),
      ('ring-madeline-size-1', 2, v_id, 'E'),
      ('ring-madeline-size-2', 3, v_id, 'F'),
      ('ring-madeline-size-3', 4, v_id, 'G'),
      ('ring-madeline-size-4', 5, v_id, 'H'),
      ('ring-madeline-size-5', 6, v_id, 'I'),
      ('ring-madeline-size-6', 7, v_id, 'J'),
      ('ring-madeline-size-7', 8, v_id, 'K'),
      ('ring-madeline-size-8', 9, v_id, 'L'),
      ('ring-madeline-size-9', 10, v_id, 'M'),
      ('ring-madeline-size-10', 11, v_id, 'N'),
      ('ring-madeline-size-11', 12, v_id, 'O'),
      ('ring-madeline-size-12', 13, v_id, 'P'),
      ('ring-madeline-size-13', 14, v_id, 'Q'),
      ('ring-madeline-size-14', 15, v_id, 'R'),
      ('ring-madeline-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-madeline-specs',
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
    'ring-maeve',
    'Maeve',
    'Maeve - Round Bezel Solitaire with Twisted Gallery Engagement Ring',
    'The Maeve design is a stunning round bezel-set engagement ring with cathedral arches and a striking twisted gallery. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-maeve';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-maeve-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/maeve/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/maeve/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-maeve-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/maeve/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/maeve/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-maeve-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/maeve/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/maeve/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-maeve-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-maeve-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-maeve-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-maeve-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-maeve-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-maeve-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-maeve-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-maeve-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-maeve-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-maeve-size-0', 1, v_id, 'D'),
      ('ring-maeve-size-1', 2, v_id, 'E'),
      ('ring-maeve-size-2', 3, v_id, 'F'),
      ('ring-maeve-size-3', 4, v_id, 'G'),
      ('ring-maeve-size-4', 5, v_id, 'H'),
      ('ring-maeve-size-5', 6, v_id, 'I'),
      ('ring-maeve-size-6', 7, v_id, 'J'),
      ('ring-maeve-size-7', 8, v_id, 'K'),
      ('ring-maeve-size-8', 9, v_id, 'L'),
      ('ring-maeve-size-9', 10, v_id, 'M'),
      ('ring-maeve-size-10', 11, v_id, 'N'),
      ('ring-maeve-size-11', 12, v_id, 'O'),
      ('ring-maeve-size-12', 13, v_id, 'P'),
      ('ring-maeve-size-13', 14, v_id, 'Q'),
      ('ring-maeve-size-14', 15, v_id, 'R'),
      ('ring-maeve-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-maeve-specs',
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
    'ring-mahlia',
    'Mahlia',
    'Mahlia - Round 6 Claw Solitaire with Sweeping Micropavé Band Engagement Ring',
    'Mahlia is an exquisite round solitaire design with a sweeping micro pavé band and six delicate round claws. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-mahlia';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-mahlia-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/mahlia/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/mahlia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-mahlia-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/mahlia/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/mahlia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-mahlia-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/mahlia/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/mahlia/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-mahlia-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-mahlia-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-mahlia-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-mahlia-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-mahlia-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-mahlia-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-mahlia-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-mahlia-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-mahlia-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-mahlia-size-0', 1, v_id, 'D'),
      ('ring-mahlia-size-1', 2, v_id, 'E'),
      ('ring-mahlia-size-2', 3, v_id, 'F'),
      ('ring-mahlia-size-3', 4, v_id, 'G'),
      ('ring-mahlia-size-4', 5, v_id, 'H'),
      ('ring-mahlia-size-5', 6, v_id, 'I'),
      ('ring-mahlia-size-6', 7, v_id, 'J'),
      ('ring-mahlia-size-7', 8, v_id, 'K'),
      ('ring-mahlia-size-8', 9, v_id, 'L'),
      ('ring-mahlia-size-9', 10, v_id, 'M'),
      ('ring-mahlia-size-10', 11, v_id, 'N'),
      ('ring-mahlia-size-11', 12, v_id, 'O'),
      ('ring-mahlia-size-12', 13, v_id, 'P'),
      ('ring-mahlia-size-13', 14, v_id, 'Q'),
      ('ring-mahlia-size-14', 15, v_id, 'R'),
      ('ring-mahlia-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-mahlia-specs',
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