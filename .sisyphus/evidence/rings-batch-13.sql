DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-chantelle',
    'Chantelle',
    'Chantelle - Marquise 6 Claw Trilogy with Pear Side Stones and Cathedral Setting Engagement Ring',
    'Chantelle centres a marquise stone with pear-cut accents on either side, brought together by a cathedral setting that creates a refined, harmonious three-stone silhouette. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'pear'::enum_ring_shape,
    'trilogy'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-chantelle';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-chantelle-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/chantelle/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/chantelle/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-chantelle-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/chantelle/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/chantelle/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-chantelle-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/chantelle/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/chantelle/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-chantelle-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-chantelle-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-chantelle-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-chantelle-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-chantelle-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-chantelle-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-chantelle-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-chantelle-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-chantelle-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-chantelle-size-0', 1, v_id, 'D'),
      ('ring-chantelle-size-1', 2, v_id, 'E'),
      ('ring-chantelle-size-2', 3, v_id, 'F'),
      ('ring-chantelle-size-3', 4, v_id, 'G'),
      ('ring-chantelle-size-4', 5, v_id, 'H'),
      ('ring-chantelle-size-5', 6, v_id, 'I'),
      ('ring-chantelle-size-6', 7, v_id, 'J'),
      ('ring-chantelle-size-7', 8, v_id, 'K'),
      ('ring-chantelle-size-8', 9, v_id, 'L'),
      ('ring-chantelle-size-9', 10, v_id, 'M'),
      ('ring-chantelle-size-10', 11, v_id, 'N'),
      ('ring-chantelle-size-11', 12, v_id, 'O'),
      ('ring-chantelle-size-12', 13, v_id, 'P'),
      ('ring-chantelle-size-13', 14, v_id, 'Q'),
      ('ring-chantelle-size-14', 15, v_id, 'R'),
      ('ring-chantelle-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-chantelle-specs',
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
    'ring-charlie',
    'Charlie',
    'Charlie - Round 4 Claw Solitaire with Hidden Halo and Pave Band Engagement Ring',
    'Charlie is a sophisticated round solitaire featuring four round claws, 2/3 pavé band and a gorgeous hidden halo for extra sparkle. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-charlie';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-charlie-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/charlie/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/charlie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-charlie-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/charlie/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/charlie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-charlie-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/charlie/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/charlie/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-charlie-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-charlie-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-charlie-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-charlie-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-charlie-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-charlie-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-charlie-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-charlie-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-charlie-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-charlie-size-0', 1, v_id, 'D'),
      ('ring-charlie-size-1', 2, v_id, 'E'),
      ('ring-charlie-size-2', 3, v_id, 'F'),
      ('ring-charlie-size-3', 4, v_id, 'G'),
      ('ring-charlie-size-4', 5, v_id, 'H'),
      ('ring-charlie-size-5', 6, v_id, 'I'),
      ('ring-charlie-size-6', 7, v_id, 'J'),
      ('ring-charlie-size-7', 8, v_id, 'K'),
      ('ring-charlie-size-8', 9, v_id, 'L'),
      ('ring-charlie-size-9', 10, v_id, 'M'),
      ('ring-charlie-size-10', 11, v_id, 'N'),
      ('ring-charlie-size-11', 12, v_id, 'O'),
      ('ring-charlie-size-12', 13, v_id, 'P'),
      ('ring-charlie-size-13', 14, v_id, 'Q'),
      ('ring-charlie-size-14', 15, v_id, 'R'),
      ('ring-charlie-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-charlie-specs',
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
    'ring-charmaine',
    'Charmaine',
    'Charmaine - Elongated Cushion 4 Claw Trilogy with Round Side Stones and Lily Detail Engagement Ring',
    'The Charmaine elongated cushion trilogy design features two round cut side stones and an intricate petal design nestled within a cathedral setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_cushion'::enum_ring_shape,
    'trilogy'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-charmaine';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-charmaine-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/charmaine/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/charmaine/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-charmaine-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/charmaine/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/charmaine/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-charmaine-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/charmaine/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/charmaine/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-charmaine-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-charmaine-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-charmaine-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-charmaine-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-charmaine-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-charmaine-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-charmaine-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-charmaine-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-charmaine-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-charmaine-size-0', 1, v_id, 'D'),
      ('ring-charmaine-size-1', 2, v_id, 'E'),
      ('ring-charmaine-size-2', 3, v_id, 'F'),
      ('ring-charmaine-size-3', 4, v_id, 'G'),
      ('ring-charmaine-size-4', 5, v_id, 'H'),
      ('ring-charmaine-size-5', 6, v_id, 'I'),
      ('ring-charmaine-size-6', 7, v_id, 'J'),
      ('ring-charmaine-size-7', 8, v_id, 'K'),
      ('ring-charmaine-size-8', 9, v_id, 'L'),
      ('ring-charmaine-size-9', 10, v_id, 'M'),
      ('ring-charmaine-size-10', 11, v_id, 'N'),
      ('ring-charmaine-size-11', 12, v_id, 'O'),
      ('ring-charmaine-size-12', 13, v_id, 'P'),
      ('ring-charmaine-size-13', 14, v_id, 'Q'),
      ('ring-charmaine-size-14', 15, v_id, 'R'),
      ('ring-charmaine-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-charmaine-specs',
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
    'ring-claudia',
    'Claudia',
    'Claudia - Cushion 4 Claw Solitaire with Hidden Halo and Pave Band Engagement Ring',
    'Claudia is a classic cushion soliatire engagement ring held within four eagle-tipped claws and complete with a hidden halo and 2/3 pavé band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'cushion'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-claudia';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-claudia-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/claudia/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/claudia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-claudia-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/claudia/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/claudia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-claudia-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/claudia/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/claudia/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-claudia-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-claudia-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-claudia-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-claudia-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-claudia-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-claudia-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-claudia-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-claudia-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-claudia-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-claudia-size-0', 1, v_id, 'D'),
      ('ring-claudia-size-1', 2, v_id, 'E'),
      ('ring-claudia-size-2', 3, v_id, 'F'),
      ('ring-claudia-size-3', 4, v_id, 'G'),
      ('ring-claudia-size-4', 5, v_id, 'H'),
      ('ring-claudia-size-5', 6, v_id, 'I'),
      ('ring-claudia-size-6', 7, v_id, 'J'),
      ('ring-claudia-size-7', 8, v_id, 'K'),
      ('ring-claudia-size-8', 9, v_id, 'L'),
      ('ring-claudia-size-9', 10, v_id, 'M'),
      ('ring-claudia-size-10', 11, v_id, 'N'),
      ('ring-claudia-size-11', 12, v_id, 'O'),
      ('ring-claudia-size-12', 13, v_id, 'P'),
      ('ring-claudia-size-13', 14, v_id, 'Q'),
      ('ring-claudia-size-14', 15, v_id, 'R'),
      ('ring-claudia-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-claudia-specs',
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
    'ring-cynthia',
    'Cynthia',
    'Cynthia - Classic Elongated Hexagon Claw Solitaire Engagement Ring',
    'The Cynthia is defined by an elongated hexagon-cut centre stone, held in place by six eagle-tipped claws and finished with a sleek, refined band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_hexagon'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-cynthia';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-cynthia-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/cynthia/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/cynthia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-cynthia-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/cynthia/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/cynthia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-cynthia-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/cynthia/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/cynthia/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-cynthia-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-cynthia-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-cynthia-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-cynthia-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-cynthia-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-cynthia-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-cynthia-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-cynthia-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-cynthia-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-cynthia-size-0', 1, v_id, 'D'),
      ('ring-cynthia-size-1', 2, v_id, 'E'),
      ('ring-cynthia-size-2', 3, v_id, 'F'),
      ('ring-cynthia-size-3', 4, v_id, 'G'),
      ('ring-cynthia-size-4', 5, v_id, 'H'),
      ('ring-cynthia-size-5', 6, v_id, 'I'),
      ('ring-cynthia-size-6', 7, v_id, 'J'),
      ('ring-cynthia-size-7', 8, v_id, 'K'),
      ('ring-cynthia-size-8', 9, v_id, 'L'),
      ('ring-cynthia-size-9', 10, v_id, 'M'),
      ('ring-cynthia-size-10', 11, v_id, 'N'),
      ('ring-cynthia-size-11', 12, v_id, 'O'),
      ('ring-cynthia-size-12', 13, v_id, 'P'),
      ('ring-cynthia-size-13', 14, v_id, 'Q'),
      ('ring-cynthia-size-14', 15, v_id, 'R'),
      ('ring-cynthia-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-cynthia-specs',
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