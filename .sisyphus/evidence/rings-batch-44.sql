DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-wanda',
    'Wanda',
    'Wanda - Elongated Hexagon 6 Claw Trilogy with Kite Side Stones Engagement Ring',
    'The Wanda engagement ring is a striking trilogy design featuring a 6-claw step-cut elongated hexagon, two kite side stones and sweeping cathedral arches. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_hexagon'::enum_ring_shape,
    'trilogy'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-wanda';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-wanda-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/wanda/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/wanda/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-wanda-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/wanda/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/wanda/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-wanda-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/wanda/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/wanda/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-wanda-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-wanda-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-wanda-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-wanda-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-wanda-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-wanda-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-wanda-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-wanda-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-wanda-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-wanda-size-0', 1, v_id, 'D'),
      ('ring-wanda-size-1', 2, v_id, 'E'),
      ('ring-wanda-size-2', 3, v_id, 'F'),
      ('ring-wanda-size-3', 4, v_id, 'G'),
      ('ring-wanda-size-4', 5, v_id, 'H'),
      ('ring-wanda-size-5', 6, v_id, 'I'),
      ('ring-wanda-size-6', 7, v_id, 'J'),
      ('ring-wanda-size-7', 8, v_id, 'K'),
      ('ring-wanda-size-8', 9, v_id, 'L'),
      ('ring-wanda-size-9', 10, v_id, 'M'),
      ('ring-wanda-size-10', 11, v_id, 'N'),
      ('ring-wanda-size-11', 12, v_id, 'O'),
      ('ring-wanda-size-12', 13, v_id, 'P'),
      ('ring-wanda-size-13', 14, v_id, 'Q'),
      ('ring-wanda-size-14', 15, v_id, 'R'),
      ('ring-wanda-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-wanda-specs',
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
    'ring-wendy',
    'Wendy',
    'Wendy - Elongated Cushion 4 Claw Solitaire with Hidden Halo, Tapered Band and Cathedral Setting Engagement Ring',
    'The Wendy engagement ring is a beautiful 4-claw elongated cushion design characterised by a sparkling hidden halo and slim tapered cathedral band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_cushion'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-wendy';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-wendy-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/wendy/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/wendy/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-wendy-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/wendy/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/wendy/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-wendy-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/wendy/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/wendy/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-wendy-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-wendy-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-wendy-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-wendy-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-wendy-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-wendy-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-wendy-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-wendy-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-wendy-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-wendy-size-0', 1, v_id, 'D'),
      ('ring-wendy-size-1', 2, v_id, 'E'),
      ('ring-wendy-size-2', 3, v_id, 'F'),
      ('ring-wendy-size-3', 4, v_id, 'G'),
      ('ring-wendy-size-4', 5, v_id, 'H'),
      ('ring-wendy-size-5', 6, v_id, 'I'),
      ('ring-wendy-size-6', 7, v_id, 'J'),
      ('ring-wendy-size-7', 8, v_id, 'K'),
      ('ring-wendy-size-8', 9, v_id, 'L'),
      ('ring-wendy-size-9', 10, v_id, 'M'),
      ('ring-wendy-size-10', 11, v_id, 'N'),
      ('ring-wendy-size-11', 12, v_id, 'O'),
      ('ring-wendy-size-12', 13, v_id, 'P'),
      ('ring-wendy-size-13', 14, v_id, 'Q'),
      ('ring-wendy-size-14', 15, v_id, 'R'),
      ('ring-wendy-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-wendy-specs',
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
    'ring-willow',
    'Willow',
    'Willow - Radiant 4 Claw Solitaire with Clustered Round Shoulder Stones Engagement Ring',
    'Willow features a radiant-cut centre stone set within a basket setting, accented by a subtle cluster of brilliant round stones. The design balances fine detail with a clean, considered silhouette. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-willow';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-willow-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/willow/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/willow/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-willow-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/willow/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/willow/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-willow-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/willow/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/willow/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-willow-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-willow-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-willow-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-willow-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-willow-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-willow-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-willow-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-willow-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-willow-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-willow-size-0', 1, v_id, 'D'),
      ('ring-willow-size-1', 2, v_id, 'E'),
      ('ring-willow-size-2', 3, v_id, 'F'),
      ('ring-willow-size-3', 4, v_id, 'G'),
      ('ring-willow-size-4', 5, v_id, 'H'),
      ('ring-willow-size-5', 6, v_id, 'I'),
      ('ring-willow-size-6', 7, v_id, 'J'),
      ('ring-willow-size-7', 8, v_id, 'K'),
      ('ring-willow-size-8', 9, v_id, 'L'),
      ('ring-willow-size-9', 10, v_id, 'M'),
      ('ring-willow-size-10', 11, v_id, 'N'),
      ('ring-willow-size-11', 12, v_id, 'O'),
      ('ring-willow-size-12', 13, v_id, 'P'),
      ('ring-willow-size-13', 14, v_id, 'Q'),
      ('ring-willow-size-14', 15, v_id, 'R'),
      ('ring-willow-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-willow-specs',
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
    'ring-winnie',
    'Winnie',
    'Winnie - Elongated Cushion 4 Claw Solitaire with Clustered Round Shoulder Stones Engagement Ring',
    'The Winnie is a charming basket-set elongated cushion design with a glamorous array of round accent stones adorning the centrepiece. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_cushion'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-winnie';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-winnie-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/winnie/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/winnie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-winnie-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/winnie/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/winnie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-winnie-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/winnie/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/winnie/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-winnie-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-winnie-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-winnie-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-winnie-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-winnie-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-winnie-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-winnie-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-winnie-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-winnie-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-winnie-size-0', 1, v_id, 'D'),
      ('ring-winnie-size-1', 2, v_id, 'E'),
      ('ring-winnie-size-2', 3, v_id, 'F'),
      ('ring-winnie-size-3', 4, v_id, 'G'),
      ('ring-winnie-size-4', 5, v_id, 'H'),
      ('ring-winnie-size-5', 6, v_id, 'I'),
      ('ring-winnie-size-6', 7, v_id, 'J'),
      ('ring-winnie-size-7', 8, v_id, 'K'),
      ('ring-winnie-size-8', 9, v_id, 'L'),
      ('ring-winnie-size-9', 10, v_id, 'M'),
      ('ring-winnie-size-10', 11, v_id, 'N'),
      ('ring-winnie-size-11', 12, v_id, 'O'),
      ('ring-winnie-size-12', 13, v_id, 'P'),
      ('ring-winnie-size-13', 14, v_id, 'Q'),
      ('ring-winnie-size-14', 15, v_id, 'R'),
      ('ring-winnie-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-winnie-specs',
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
    'ring-yasmine',
    'Yasmine',
    'Yasmine - Elongated Cushion 4 Claw Solitaire with Hidden Halo and Cathedral Setting Engagement Ring',
    'Yasmine is a timeless elongated cushion solitaire, featuring a sparkling hidden halo within an elegant four-claw setting. Its sweeping cathedral band adds a touch of sophistication, creating a versatile design that effortlessly blends classic elegance with modern style. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_cushion'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-yasmine';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-yasmine-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/yasmine/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/yasmine/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-yasmine-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/yasmine/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/yasmine/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-yasmine-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/yasmine/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/yasmine/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-yasmine-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-yasmine-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-yasmine-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-yasmine-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-yasmine-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-yasmine-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-yasmine-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-yasmine-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-yasmine-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-yasmine-size-0', 1, v_id, 'D'),
      ('ring-yasmine-size-1', 2, v_id, 'E'),
      ('ring-yasmine-size-2', 3, v_id, 'F'),
      ('ring-yasmine-size-3', 4, v_id, 'G'),
      ('ring-yasmine-size-4', 5, v_id, 'H'),
      ('ring-yasmine-size-5', 6, v_id, 'I'),
      ('ring-yasmine-size-6', 7, v_id, 'J'),
      ('ring-yasmine-size-7', 8, v_id, 'K'),
      ('ring-yasmine-size-8', 9, v_id, 'L'),
      ('ring-yasmine-size-9', 10, v_id, 'M'),
      ('ring-yasmine-size-10', 11, v_id, 'N'),
      ('ring-yasmine-size-11', 12, v_id, 'O'),
      ('ring-yasmine-size-12', 13, v_id, 'P'),
      ('ring-yasmine-size-13', 14, v_id, 'Q'),
      ('ring-yasmine-size-14', 15, v_id, 'R'),
      ('ring-yasmine-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-yasmine-specs',
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