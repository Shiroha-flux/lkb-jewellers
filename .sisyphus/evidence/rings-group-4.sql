DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-elise',
    'Elise',
    'Elise - Oval 4 Claw Solitaire with 6 Spaced Round Accent Stones and Hidden Halo Engagement Ring',
    'With an eye-catching oval cut centre stone, the Elise engagement ring is characterised by a sparkling hidden halo and a unique band set with round cut stones. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'accents'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-elise';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-elise-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/elise/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/elise/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-elise-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/elise/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/elise/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-elise-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/elise/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/elise/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-elise-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-elise-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-elise-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-elise-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-elise-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-elise-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-elise-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-elise-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-elise-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-elise-size-0', 1, v_id, 'D'),
      ('ring-elise-size-1', 2, v_id, 'E'),
      ('ring-elise-size-2', 3, v_id, 'F'),
      ('ring-elise-size-3', 4, v_id, 'G'),
      ('ring-elise-size-4', 5, v_id, 'H'),
      ('ring-elise-size-5', 6, v_id, 'I'),
      ('ring-elise-size-6', 7, v_id, 'J'),
      ('ring-elise-size-7', 8, v_id, 'K'),
      ('ring-elise-size-8', 9, v_id, 'L'),
      ('ring-elise-size-9', 10, v_id, 'M'),
      ('ring-elise-size-10', 11, v_id, 'N'),
      ('ring-elise-size-11', 12, v_id, 'O'),
      ('ring-elise-size-12', 13, v_id, 'P'),
      ('ring-elise-size-13', 14, v_id, 'Q'),
      ('ring-elise-size-14', 15, v_id, 'R'),
      ('ring-elise-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-elise-specs',
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
    'ring-ella',
    'Ella',
    'Ella - Round 4 Claw Trilogy with Round Side Stones and Pave Band Engagement Ring',
    'Ella is a classic round trilogy design accentuated by round claws, sweeping trellis setting and half pavé band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'trilogy'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-ella';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-ella-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ella/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ella/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-ella-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ella/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ella/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-ella-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ella/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ella/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ella-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-ella-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-ella-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-ella-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ella-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-ella-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ella-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-ella-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-ella-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-ella-size-0', 1, v_id, 'D'),
      ('ring-ella-size-1', 2, v_id, 'E'),
      ('ring-ella-size-2', 3, v_id, 'F'),
      ('ring-ella-size-3', 4, v_id, 'G'),
      ('ring-ella-size-4', 5, v_id, 'H'),
      ('ring-ella-size-5', 6, v_id, 'I'),
      ('ring-ella-size-6', 7, v_id, 'J'),
      ('ring-ella-size-7', 8, v_id, 'K'),
      ('ring-ella-size-8', 9, v_id, 'L'),
      ('ring-ella-size-9', 10, v_id, 'M'),
      ('ring-ella-size-10', 11, v_id, 'N'),
      ('ring-ella-size-11', 12, v_id, 'O'),
      ('ring-ella-size-12', 13, v_id, 'P'),
      ('ring-ella-size-13', 14, v_id, 'Q'),
      ('ring-ella-size-14', 15, v_id, 'R'),
      ('ring-ella-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-ella-specs',
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
    'ring-elle',
    'Elle',
    'Elle - Elongated Cushion Claw Solitaire with Hidden Halo, Opposing Marquise Accents and Cathedral High Setting Engagement Ring',
    'The Elle engagement ring showcases a 4-claw elongated cushion centre stone, illuminated by a hidden halo beneath. A refined cathedral setting gives height and presence, while opposing marquise-cut side stones taper delicately along the band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_cushion'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'accents'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-elle';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-elle-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/elle/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/elle/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-elle-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/elle/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/elle/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-elle-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/elle/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/elle/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-elle-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-elle-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-elle-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-elle-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-elle-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-elle-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-elle-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-elle-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-elle-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-elle-size-0', 1, v_id, 'D'),
      ('ring-elle-size-1', 2, v_id, 'E'),
      ('ring-elle-size-2', 3, v_id, 'F'),
      ('ring-elle-size-3', 4, v_id, 'G'),
      ('ring-elle-size-4', 5, v_id, 'H'),
      ('ring-elle-size-5', 6, v_id, 'I'),
      ('ring-elle-size-6', 7, v_id, 'J'),
      ('ring-elle-size-7', 8, v_id, 'K'),
      ('ring-elle-size-8', 9, v_id, 'L'),
      ('ring-elle-size-9', 10, v_id, 'M'),
      ('ring-elle-size-10', 11, v_id, 'N'),
      ('ring-elle-size-11', 12, v_id, 'O'),
      ('ring-elle-size-12', 13, v_id, 'P'),
      ('ring-elle-size-13', 14, v_id, 'Q'),
      ('ring-elle-size-14', 15, v_id, 'R'),
      ('ring-elle-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-elle-specs',
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
    'ring-ellie',
    'Ellie',
    'Ellie - Radiant 4 Claw Solitaire with Wrap Around Hidden Halo and Pave Band Engagement Ring',
    'With a stunning radiant cut centre stone, the Ellie engagement ring is elevated by a wrap-around hidden halo and 2/3 pavé band. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-ellie';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-ellie-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ellie/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ellie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-ellie-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ellie/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ellie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-ellie-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ellie/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ellie/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ellie-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-ellie-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-ellie-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-ellie-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ellie-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-ellie-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ellie-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-ellie-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-ellie-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-ellie-size-0', 1, v_id, 'D'),
      ('ring-ellie-size-1', 2, v_id, 'E'),
      ('ring-ellie-size-2', 3, v_id, 'F'),
      ('ring-ellie-size-3', 4, v_id, 'G'),
      ('ring-ellie-size-4', 5, v_id, 'H'),
      ('ring-ellie-size-5', 6, v_id, 'I'),
      ('ring-ellie-size-6', 7, v_id, 'J'),
      ('ring-ellie-size-7', 8, v_id, 'K'),
      ('ring-ellie-size-8', 9, v_id, 'L'),
      ('ring-ellie-size-9', 10, v_id, 'M'),
      ('ring-ellie-size-10', 11, v_id, 'N'),
      ('ring-ellie-size-11', 12, v_id, 'O'),
      ('ring-ellie-size-12', 13, v_id, 'P'),
      ('ring-ellie-size-13', 14, v_id, 'Q'),
      ('ring-ellie-size-14', 15, v_id, 'R'),
      ('ring-ellie-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-ellie-specs',
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
    'ring-elphie',
    'Elphie',
    'Elphie - Emerald Claw Trilogy with Kite Side Stones Engagement Ring',
    'Elphie is a refined trilogy engagement ring, defined by a 4-claw step-cut emerald. Kite side stones taper alongside the centre, set within sweeping cathedral arches. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'emerald'::enum_ring_shape,
    'trilogy'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-elphie';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-elphie-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/elphie/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/elphie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-elphie-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/elphie/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/elphie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-elphie-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/elphie/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/elphie/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-elphie-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-elphie-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-elphie-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-elphie-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-elphie-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-elphie-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-elphie-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-elphie-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-elphie-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-elphie-size-0', 1, v_id, 'D'),
      ('ring-elphie-size-1', 2, v_id, 'E'),
      ('ring-elphie-size-2', 3, v_id, 'F'),
      ('ring-elphie-size-3', 4, v_id, 'G'),
      ('ring-elphie-size-4', 5, v_id, 'H'),
      ('ring-elphie-size-5', 6, v_id, 'I'),
      ('ring-elphie-size-6', 7, v_id, 'J'),
      ('ring-elphie-size-7', 8, v_id, 'K'),
      ('ring-elphie-size-8', 9, v_id, 'L'),
      ('ring-elphie-size-9', 10, v_id, 'M'),
      ('ring-elphie-size-10', 11, v_id, 'N'),
      ('ring-elphie-size-11', 12, v_id, 'O'),
      ('ring-elphie-size-12', 13, v_id, 'P'),
      ('ring-elphie-size-13', 14, v_id, 'Q'),
      ('ring-elphie-size-14', 15, v_id, 'R'),
      ('ring-elphie-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-elphie-specs',
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
    'ring-elsie',
    'Elsie',
    'Elsie - Marquise 6 Claw Solitaire with Hidden Halo, Opposing Marquise Accents and Cathedral Setting Engagement Ring',
    'The Elsie engagement ring showcases a stunning 6-claw marquise cut centre stone, sparkling hidden halo and an elegant cathedral setting featuring two pairs of opposing marquise cut side stones delicately graduating along the band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'marquise'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'accents'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-elsie';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-elsie-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/elsie/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/elsie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-elsie-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/elsie/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/elsie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-elsie-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/elsie/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/elsie/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-elsie-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-elsie-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-elsie-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-elsie-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-elsie-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-elsie-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-elsie-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-elsie-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-elsie-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-elsie-size-0', 1, v_id, 'D'),
      ('ring-elsie-size-1', 2, v_id, 'E'),
      ('ring-elsie-size-2', 3, v_id, 'F'),
      ('ring-elsie-size-3', 4, v_id, 'G'),
      ('ring-elsie-size-4', 5, v_id, 'H'),
      ('ring-elsie-size-5', 6, v_id, 'I'),
      ('ring-elsie-size-6', 7, v_id, 'J'),
      ('ring-elsie-size-7', 8, v_id, 'K'),
      ('ring-elsie-size-8', 9, v_id, 'L'),
      ('ring-elsie-size-9', 10, v_id, 'M'),
      ('ring-elsie-size-10', 11, v_id, 'N'),
      ('ring-elsie-size-11', 12, v_id, 'O'),
      ('ring-elsie-size-12', 13, v_id, 'P'),
      ('ring-elsie-size-13', 14, v_id, 'Q'),
      ('ring-elsie-size-14', 15, v_id, 'R'),
      ('ring-elsie-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-elsie-specs',
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
    'ring-ember',
    'Ember',
    'Ember Engagement Ring',
    'The Ember is a beautiful engagement ring from Cullen Jewellery.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-ember';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-ember-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ember/renders/2ct/High%20Setting/Yellow/main', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ember/renders/2ct/High%20Setting/Yellow/main')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ember-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-ember-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-ember-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-ember-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ember-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-ember-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ember-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-ember-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-ember-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-ember-size-0', 1, v_id, 'D'),
      ('ring-ember-size-1', 2, v_id, 'E'),
      ('ring-ember-size-2', 3, v_id, 'F'),
      ('ring-ember-size-3', 4, v_id, 'G'),
      ('ring-ember-size-4', 5, v_id, 'H'),
      ('ring-ember-size-5', 6, v_id, 'I'),
      ('ring-ember-size-6', 7, v_id, 'J'),
      ('ring-ember-size-7', 8, v_id, 'K'),
      ('ring-ember-size-8', 9, v_id, 'L'),
      ('ring-ember-size-9', 10, v_id, 'M'),
      ('ring-ember-size-10', 11, v_id, 'N'),
      ('ring-ember-size-11', 12, v_id, 'O'),
      ('ring-ember-size-12', 13, v_id, 'P'),
      ('ring-ember-size-13', 14, v_id, 'Q'),
      ('ring-ember-size-14', 15, v_id, 'R'),
      ('ring-ember-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-ember-specs',
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
    'ring-emily',
    'Emily',
    'Emily - Oval 4 Claw Solitaire with Tapered Band and Cathedral Setting Engagement Ring',
    'Emily is a beautiful oval solitaire design with four round claws, a slim tapered band and a stunning oval cut centre stone set low into a sleek band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-emily';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-emily-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/emily/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/emily/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-emily-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/emily/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/emily/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-emily-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/emily/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/emily/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-emily-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-emily-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-emily-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-emily-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-emily-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-emily-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-emily-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-emily-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-emily-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-emily-size-0', 1, v_id, 'D'),
      ('ring-emily-size-1', 2, v_id, 'E'),
      ('ring-emily-size-2', 3, v_id, 'F'),
      ('ring-emily-size-3', 4, v_id, 'G'),
      ('ring-emily-size-4', 5, v_id, 'H'),
      ('ring-emily-size-5', 6, v_id, 'I'),
      ('ring-emily-size-6', 7, v_id, 'J'),
      ('ring-emily-size-7', 8, v_id, 'K'),
      ('ring-emily-size-8', 9, v_id, 'L'),
      ('ring-emily-size-9', 10, v_id, 'M'),
      ('ring-emily-size-10', 11, v_id, 'N'),
      ('ring-emily-size-11', 12, v_id, 'O'),
      ('ring-emily-size-12', 13, v_id, 'P'),
      ('ring-emily-size-13', 14, v_id, 'Q'),
      ('ring-emily-size-14', 15, v_id, 'R'),
      ('ring-emily-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-emily-specs',
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
    'ring-emma',
    'Emma',
    'Emma - Classic Oval 4 Claw Solitaire with Hidden Halo Engagement Ring',
    'Popular for its timeless beauty, the Emma engagement ring is a classic 4-claw oval solitaire design complete with a sparkling hidden halo. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-emma';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-emma-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/emma/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/emma/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-emma-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/emma/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/emma/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-emma-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/emma/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/emma/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-emma-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-emma-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-emma-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-emma-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-emma-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-emma-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-emma-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-emma-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-emma-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-emma-size-0', 1, v_id, 'D'),
      ('ring-emma-size-1', 2, v_id, 'E'),
      ('ring-emma-size-2', 3, v_id, 'F'),
      ('ring-emma-size-3', 4, v_id, 'G'),
      ('ring-emma-size-4', 5, v_id, 'H'),
      ('ring-emma-size-5', 6, v_id, 'I'),
      ('ring-emma-size-6', 7, v_id, 'J'),
      ('ring-emma-size-7', 8, v_id, 'K'),
      ('ring-emma-size-8', 9, v_id, 'L'),
      ('ring-emma-size-9', 10, v_id, 'M'),
      ('ring-emma-size-10', 11, v_id, 'N'),
      ('ring-emma-size-11', 12, v_id, 'O'),
      ('ring-emma-size-12', 13, v_id, 'P'),
      ('ring-emma-size-13', 14, v_id, 'Q'),
      ('ring-emma-size-14', 15, v_id, 'R'),
      ('ring-emma-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-emma-specs',
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
    'ring-emmy',
    'Emmy',
    'Emmy - Asscher 4 Claw Solitaire Engagement Ring',
    'The exquisite Emmy engagement ring features an asscher cut centre stone held by four eagle-tipped claws and set low into a sleek band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'asscher'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-emmy';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-emmy-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/emmy/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/emmy/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-emmy-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/emmy/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/emmy/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-emmy-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/emmy/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/emmy/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-emmy-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-emmy-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-emmy-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-emmy-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-emmy-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-emmy-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-emmy-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-emmy-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-emmy-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-emmy-size-0', 1, v_id, 'D'),
      ('ring-emmy-size-1', 2, v_id, 'E'),
      ('ring-emmy-size-2', 3, v_id, 'F'),
      ('ring-emmy-size-3', 4, v_id, 'G'),
      ('ring-emmy-size-4', 5, v_id, 'H'),
      ('ring-emmy-size-5', 6, v_id, 'I'),
      ('ring-emmy-size-6', 7, v_id, 'J'),
      ('ring-emmy-size-7', 8, v_id, 'K'),
      ('ring-emmy-size-8', 9, v_id, 'L'),
      ('ring-emmy-size-9', 10, v_id, 'M'),
      ('ring-emmy-size-10', 11, v_id, 'N'),
      ('ring-emmy-size-11', 12, v_id, 'O'),
      ('ring-emmy-size-12', 13, v_id, 'P'),
      ('ring-emmy-size-13', 14, v_id, 'Q'),
      ('ring-emmy-size-14', 15, v_id, 'R'),
      ('ring-emmy-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-emmy-specs',
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
    'ring-evangeline',
    'Evangeline',
    'Evangeline - Oval 4 Claw Solitaire with Wrap Around Hidden Halo and Pave Band Engagement Ring',
    'Evangeline features a round solitaire held in a refined six-claw setting, complemented by a wrap-around hidden halo and a pavé band extending two-thirds of the way around. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-evangeline';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-evangeline-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/evangeline/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/evangeline/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-evangeline-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/evangeline/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/evangeline/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-evangeline-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/evangeline/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/evangeline/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-evangeline-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-evangeline-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-evangeline-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-evangeline-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-evangeline-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-evangeline-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-evangeline-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-evangeline-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-evangeline-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-evangeline-size-0', 1, v_id, 'D'),
      ('ring-evangeline-size-1', 2, v_id, 'E'),
      ('ring-evangeline-size-2', 3, v_id, 'F'),
      ('ring-evangeline-size-3', 4, v_id, 'G'),
      ('ring-evangeline-size-4', 5, v_id, 'H'),
      ('ring-evangeline-size-5', 6, v_id, 'I'),
      ('ring-evangeline-size-6', 7, v_id, 'J'),
      ('ring-evangeline-size-7', 8, v_id, 'K'),
      ('ring-evangeline-size-8', 9, v_id, 'L'),
      ('ring-evangeline-size-9', 10, v_id, 'M'),
      ('ring-evangeline-size-10', 11, v_id, 'N'),
      ('ring-evangeline-size-11', 12, v_id, 'O'),
      ('ring-evangeline-size-12', 13, v_id, 'P'),
      ('ring-evangeline-size-13', 14, v_id, 'Q'),
      ('ring-evangeline-size-14', 15, v_id, 'R'),
      ('ring-evangeline-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-evangeline-specs',
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
    'ring-eve',
    'Eve',
    'Eve - Marquise Claw Solitaire with Petal Gallery Engagement Ring',
    'The beautiful Eve engagement ring features a striking marquise cut centre stone held by six eagle-tipped claws within a beautiful petal-like setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'marquise'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-eve';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-eve-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/eve/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/eve/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-eve-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/eve/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/eve/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-eve-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/eve/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/eve/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-eve-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-eve-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-eve-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-eve-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-eve-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-eve-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-eve-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-eve-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-eve-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-eve-size-0', 1, v_id, 'D'),
      ('ring-eve-size-1', 2, v_id, 'E'),
      ('ring-eve-size-2', 3, v_id, 'F'),
      ('ring-eve-size-3', 4, v_id, 'G'),
      ('ring-eve-size-4', 5, v_id, 'H'),
      ('ring-eve-size-5', 6, v_id, 'I'),
      ('ring-eve-size-6', 7, v_id, 'J'),
      ('ring-eve-size-7', 8, v_id, 'K'),
      ('ring-eve-size-8', 9, v_id, 'L'),
      ('ring-eve-size-9', 10, v_id, 'M'),
      ('ring-eve-size-10', 11, v_id, 'N'),
      ('ring-eve-size-11', 12, v_id, 'O'),
      ('ring-eve-size-12', 13, v_id, 'P'),
      ('ring-eve-size-13', 14, v_id, 'Q'),
      ('ring-eve-size-14', 15, v_id, 'R'),
      ('ring-eve-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-eve-specs',
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
    'ring-evelyn',
    'Evelyn',
    'Evelyn - Emerald 4 Claw Solitaire with East West Setting and Raised Basket Gallery Engagement Ring',
    'A signature east-west design, Evelyn modernises the timeless look of a solitaire ring by introducing directional appeal with a beautiful emerald cut stone set east-to-west on a polished band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'emerald'::enum_ring_shape,
    'east_west'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-evelyn';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-evelyn-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/evelyn/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/evelyn/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-evelyn-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/evelyn/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/evelyn/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-evelyn-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/evelyn/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/evelyn/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-evelyn-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-evelyn-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-evelyn-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-evelyn-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-evelyn-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-evelyn-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-evelyn-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-evelyn-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-evelyn-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-evelyn-size-0', 1, v_id, 'D'),
      ('ring-evelyn-size-1', 2, v_id, 'E'),
      ('ring-evelyn-size-2', 3, v_id, 'F'),
      ('ring-evelyn-size-3', 4, v_id, 'G'),
      ('ring-evelyn-size-4', 5, v_id, 'H'),
      ('ring-evelyn-size-5', 6, v_id, 'I'),
      ('ring-evelyn-size-6', 7, v_id, 'J'),
      ('ring-evelyn-size-7', 8, v_id, 'K'),
      ('ring-evelyn-size-8', 9, v_id, 'L'),
      ('ring-evelyn-size-9', 10, v_id, 'M'),
      ('ring-evelyn-size-10', 11, v_id, 'N'),
      ('ring-evelyn-size-11', 12, v_id, 'O'),
      ('ring-evelyn-size-12', 13, v_id, 'P'),
      ('ring-evelyn-size-13', 14, v_id, 'Q'),
      ('ring-evelyn-size-14', 15, v_id, 'R'),
      ('ring-evelyn-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-evelyn-specs',
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
    'ring-everleigh',
    'Everleigh',
    'Everleigh - Elongated Cushion Bezel Solitaire with Hidden Halo and Cathedral Setting Engagement Ring',
    'Everleigh is a modern interpretation of the bezel design, encapsulating an elongated cushion-cut centre stone within a deep setting. A hidden pavé detail sits within the bezel, supported by a cathedral foundation for balanced structure. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-everleigh';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-everleigh-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/everleigh/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/everleigh/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-everleigh-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/everleigh/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/everleigh/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-everleigh-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/everleigh/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/everleigh/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-everleigh-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-everleigh-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-everleigh-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-everleigh-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-everleigh-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-everleigh-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-everleigh-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-everleigh-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-everleigh-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-everleigh-size-0', 1, v_id, 'D'),
      ('ring-everleigh-size-1', 2, v_id, 'E'),
      ('ring-everleigh-size-2', 3, v_id, 'F'),
      ('ring-everleigh-size-3', 4, v_id, 'G'),
      ('ring-everleigh-size-4', 5, v_id, 'H'),
      ('ring-everleigh-size-5', 6, v_id, 'I'),
      ('ring-everleigh-size-6', 7, v_id, 'J'),
      ('ring-everleigh-size-7', 8, v_id, 'K'),
      ('ring-everleigh-size-8', 9, v_id, 'L'),
      ('ring-everleigh-size-9', 10, v_id, 'M'),
      ('ring-everleigh-size-10', 11, v_id, 'N'),
      ('ring-everleigh-size-11', 12, v_id, 'O'),
      ('ring-everleigh-size-12', 13, v_id, 'P'),
      ('ring-everleigh-size-13', 14, v_id, 'Q'),
      ('ring-everleigh-size-14', 15, v_id, 'R'),
      ('ring-everleigh-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-everleigh-specs',
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
    'ring-fiona',
    'Fiona',
    'Fiona - Elongated Cushion East West Claw Solitaire with Raised Basket Gallery Engagement Ring',
    'Fiona is an east–west set elongated cushion-cut centre stone positioned low within a scooped basket. The setting allows the profile to sit flush against a classic band, creating a clean, understated design with smooth, continuous lines. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_cushion'::enum_ring_shape,
    'east_west'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-fiona';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-fiona-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/fiona/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/fiona/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-fiona-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/fiona/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/fiona/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-fiona-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/fiona/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/fiona/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-fiona-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-fiona-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-fiona-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-fiona-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-fiona-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-fiona-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-fiona-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-fiona-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-fiona-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-fiona-size-0', 1, v_id, 'D'),
      ('ring-fiona-size-1', 2, v_id, 'E'),
      ('ring-fiona-size-2', 3, v_id, 'F'),
      ('ring-fiona-size-3', 4, v_id, 'G'),
      ('ring-fiona-size-4', 5, v_id, 'H'),
      ('ring-fiona-size-5', 6, v_id, 'I'),
      ('ring-fiona-size-6', 7, v_id, 'J'),
      ('ring-fiona-size-7', 8, v_id, 'K'),
      ('ring-fiona-size-8', 9, v_id, 'L'),
      ('ring-fiona-size-9', 10, v_id, 'M'),
      ('ring-fiona-size-10', 11, v_id, 'N'),
      ('ring-fiona-size-11', 12, v_id, 'O'),
      ('ring-fiona-size-12', 13, v_id, 'P'),
      ('ring-fiona-size-13', 14, v_id, 'Q'),
      ('ring-fiona-size-14', 15, v_id, 'R'),
      ('ring-fiona-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-fiona-specs',
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
    'ring-francesca',
    'Francesca',
    'Francesca - Pear and Pear Claw Toi et Moi Engagement Ring',
    'Francesca is a beautiful toi et moi engagement ring featuring two pear cut centre stones positioned in a complementary manner to radiate a fresh yet timeless aesthetic. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'pear'::enum_ring_shape,
    'toi_et_moi'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-francesca';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-francesca-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/francesca/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/francesca/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-francesca-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/francesca/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/francesca/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-francesca-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/francesca/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/francesca/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-francesca-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-francesca-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-francesca-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-francesca-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-francesca-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-francesca-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-francesca-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-francesca-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-francesca-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-francesca-size-0', 1, v_id, 'D'),
      ('ring-francesca-size-1', 2, v_id, 'E'),
      ('ring-francesca-size-2', 3, v_id, 'F'),
      ('ring-francesca-size-3', 4, v_id, 'G'),
      ('ring-francesca-size-4', 5, v_id, 'H'),
      ('ring-francesca-size-5', 6, v_id, 'I'),
      ('ring-francesca-size-6', 7, v_id, 'J'),
      ('ring-francesca-size-7', 8, v_id, 'K'),
      ('ring-francesca-size-8', 9, v_id, 'L'),
      ('ring-francesca-size-9', 10, v_id, 'M'),
      ('ring-francesca-size-10', 11, v_id, 'N'),
      ('ring-francesca-size-11', 12, v_id, 'O'),
      ('ring-francesca-size-12', 13, v_id, 'P'),
      ('ring-francesca-size-13', 14, v_id, 'Q'),
      ('ring-francesca-size-14', 15, v_id, 'R'),
      ('ring-francesca-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-francesca-specs',
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
    'ring-frankie',
    'Frankie',
    'Frankie - Statement Radiant East West Bezel Solitaire with Flat Cigar Band Engagement Ring',
    'Frankie is an east–west set radiant-cut centre stone enclosed within a statement bezel. The design flows into a flat-profile cigar band, creating clean lines and a modern, bold composition. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'radiant'::enum_ring_shape,
    'bezel'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-frankie';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-frankie-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/frankie/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/frankie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-frankie-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/frankie/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/frankie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-frankie-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/frankie/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/frankie/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-frankie-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-frankie-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-frankie-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-frankie-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-frankie-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-frankie-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-frankie-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-frankie-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-frankie-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-frankie-size-0', 1, v_id, 'D'),
      ('ring-frankie-size-1', 2, v_id, 'E'),
      ('ring-frankie-size-2', 3, v_id, 'F'),
      ('ring-frankie-size-3', 4, v_id, 'G'),
      ('ring-frankie-size-4', 5, v_id, 'H'),
      ('ring-frankie-size-5', 6, v_id, 'I'),
      ('ring-frankie-size-6', 7, v_id, 'J'),
      ('ring-frankie-size-7', 8, v_id, 'K'),
      ('ring-frankie-size-8', 9, v_id, 'L'),
      ('ring-frankie-size-9', 10, v_id, 'M'),
      ('ring-frankie-size-10', 11, v_id, 'N'),
      ('ring-frankie-size-11', 12, v_id, 'O'),
      ('ring-frankie-size-12', 13, v_id, 'P'),
      ('ring-frankie-size-13', 14, v_id, 'Q'),
      ('ring-frankie-size-14', 15, v_id, 'R'),
      ('ring-frankie-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-frankie-specs',
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
    'ring-freya',
    'Freya',
    'Freya - Emerald 4 Claw Solitaire with Tapered Band and Cathedral Setting Engagement Ring',
    'Sleek in its design, the Freya engagement ring features an elegant emerald cut centre stone held by four round claws and set low on a slim tapered band. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-freya';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-freya-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/freya/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/freya/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-freya-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/freya/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/freya/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-freya-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/freya/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/freya/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-freya-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-freya-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-freya-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-freya-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-freya-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-freya-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-freya-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-freya-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-freya-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-freya-size-0', 1, v_id, 'D'),
      ('ring-freya-size-1', 2, v_id, 'E'),
      ('ring-freya-size-2', 3, v_id, 'F'),
      ('ring-freya-size-3', 4, v_id, 'G'),
      ('ring-freya-size-4', 5, v_id, 'H'),
      ('ring-freya-size-5', 6, v_id, 'I'),
      ('ring-freya-size-6', 7, v_id, 'J'),
      ('ring-freya-size-7', 8, v_id, 'K'),
      ('ring-freya-size-8', 9, v_id, 'L'),
      ('ring-freya-size-9', 10, v_id, 'M'),
      ('ring-freya-size-10', 11, v_id, 'N'),
      ('ring-freya-size-11', 12, v_id, 'O'),
      ('ring-freya-size-12', 13, v_id, 'P'),
      ('ring-freya-size-13', 14, v_id, 'Q'),
      ('ring-freya-size-14', 15, v_id, 'R'),
      ('ring-freya-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-freya-specs',
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
    'ring-freesia',
    'Freesia',
    'Freesia - Emerald Claw Solitaire with Petal Gallery and Accented Tiara Detail Engagement Ring',
    'Freesia centres a emerald stone in a refined four-claw setting, framed by a sculpted petal gallery. A discreet tiara-style hidden halo sits beneath, adding quiet detail and soft, modern structure. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'emerald'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'accents'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-freesia';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-freesia-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/freesia/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/freesia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-freesia-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/freesia/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/freesia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-freesia-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/freesia/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/freesia/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-freesia-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-freesia-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-freesia-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-freesia-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-freesia-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-freesia-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-freesia-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-freesia-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-freesia-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-freesia-size-0', 1, v_id, 'D'),
      ('ring-freesia-size-1', 2, v_id, 'E'),
      ('ring-freesia-size-2', 3, v_id, 'F'),
      ('ring-freesia-size-3', 4, v_id, 'G'),
      ('ring-freesia-size-4', 5, v_id, 'H'),
      ('ring-freesia-size-5', 6, v_id, 'I'),
      ('ring-freesia-size-6', 7, v_id, 'J'),
      ('ring-freesia-size-7', 8, v_id, 'K'),
      ('ring-freesia-size-8', 9, v_id, 'L'),
      ('ring-freesia-size-9', 10, v_id, 'M'),
      ('ring-freesia-size-10', 11, v_id, 'N'),
      ('ring-freesia-size-11', 12, v_id, 'O'),
      ('ring-freesia-size-12', 13, v_id, 'P'),
      ('ring-freesia-size-13', 14, v_id, 'Q'),
      ('ring-freesia-size-14', 15, v_id, 'R'),
      ('ring-freesia-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-freesia-specs',
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
    'ring-gabrielle',
    'Gabrielle',
    'Gabrielle - Round 6 Claw Solitaire with Square Tips and Solid Cathedral Setting Engagement Ring',
    'The Gabrielle is a signature round solitaire design featuring a beautiful round cut centre stone and 6-claw setting, placed low on a polished band. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-gabrielle';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-gabrielle-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/gabrielle/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/gabrielle/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-gabrielle-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/gabrielle/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/gabrielle/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-gabrielle-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/gabrielle/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/gabrielle/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-gabrielle-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-gabrielle-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-gabrielle-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-gabrielle-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-gabrielle-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-gabrielle-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-gabrielle-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-gabrielle-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-gabrielle-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-gabrielle-size-0', 1, v_id, 'D'),
      ('ring-gabrielle-size-1', 2, v_id, 'E'),
      ('ring-gabrielle-size-2', 3, v_id, 'F'),
      ('ring-gabrielle-size-3', 4, v_id, 'G'),
      ('ring-gabrielle-size-4', 5, v_id, 'H'),
      ('ring-gabrielle-size-5', 6, v_id, 'I'),
      ('ring-gabrielle-size-6', 7, v_id, 'J'),
      ('ring-gabrielle-size-7', 8, v_id, 'K'),
      ('ring-gabrielle-size-8', 9, v_id, 'L'),
      ('ring-gabrielle-size-9', 10, v_id, 'M'),
      ('ring-gabrielle-size-10', 11, v_id, 'N'),
      ('ring-gabrielle-size-11', 12, v_id, 'O'),
      ('ring-gabrielle-size-12', 13, v_id, 'P'),
      ('ring-gabrielle-size-13', 14, v_id, 'Q'),
      ('ring-gabrielle-size-14', 15, v_id, 'R'),
      ('ring-gabrielle-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-gabrielle-specs',
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
    'ring-gemma',
    'Gemma',
    'Gemma - Oval Bezel Solitaire with Twisted Gallery Engagement Ring',
    'The Gemma engagement ring adds a distinct flourish to the classic oval solitaire with a bezel-set oval cut centre stone and unique, intertwining cathedral design. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'bezel'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-gemma';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-gemma-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/gemma/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/gemma/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-gemma-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/gemma/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/gemma/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-gemma-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/gemma/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/gemma/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-gemma-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-gemma-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-gemma-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-gemma-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-gemma-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-gemma-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-gemma-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-gemma-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-gemma-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-gemma-size-0', 1, v_id, 'D'),
      ('ring-gemma-size-1', 2, v_id, 'E'),
      ('ring-gemma-size-2', 3, v_id, 'F'),
      ('ring-gemma-size-3', 4, v_id, 'G'),
      ('ring-gemma-size-4', 5, v_id, 'H'),
      ('ring-gemma-size-5', 6, v_id, 'I'),
      ('ring-gemma-size-6', 7, v_id, 'J'),
      ('ring-gemma-size-7', 8, v_id, 'K'),
      ('ring-gemma-size-8', 9, v_id, 'L'),
      ('ring-gemma-size-9', 10, v_id, 'M'),
      ('ring-gemma-size-10', 11, v_id, 'N'),
      ('ring-gemma-size-11', 12, v_id, 'O'),
      ('ring-gemma-size-12', 13, v_id, 'P'),
      ('ring-gemma-size-13', 14, v_id, 'Q'),
      ('ring-gemma-size-14', 15, v_id, 'R'),
      ('ring-gemma-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-gemma-specs',
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
    'ring-genevieve',
    'Genevieve',
    'Genevieve - Marquise 4 Claw Solitaire Engagement Ring',
    'Genevieve is a beautiful solitaire engagement ring showcasing a striking marquise cut centre stone held by four eagle-tipped claws. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'marquise'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-genevieve';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-genevieve-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/genevieve/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/genevieve/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-genevieve-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/genevieve/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/genevieve/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-genevieve-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/genevieve/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/genevieve/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-genevieve-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-genevieve-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-genevieve-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-genevieve-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-genevieve-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-genevieve-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-genevieve-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-genevieve-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-genevieve-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-genevieve-size-0', 1, v_id, 'D'),
      ('ring-genevieve-size-1', 2, v_id, 'E'),
      ('ring-genevieve-size-2', 3, v_id, 'F'),
      ('ring-genevieve-size-3', 4, v_id, 'G'),
      ('ring-genevieve-size-4', 5, v_id, 'H'),
      ('ring-genevieve-size-5', 6, v_id, 'I'),
      ('ring-genevieve-size-6', 7, v_id, 'J'),
      ('ring-genevieve-size-7', 8, v_id, 'K'),
      ('ring-genevieve-size-8', 9, v_id, 'L'),
      ('ring-genevieve-size-9', 10, v_id, 'M'),
      ('ring-genevieve-size-10', 11, v_id, 'N'),
      ('ring-genevieve-size-11', 12, v_id, 'O'),
      ('ring-genevieve-size-12', 13, v_id, 'P'),
      ('ring-genevieve-size-13', 14, v_id, 'Q'),
      ('ring-genevieve-size-14', 15, v_id, 'R'),
      ('ring-genevieve-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-genevieve-specs',
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
    'ring-georgia',
    'Georgia',
    'Georgia - Round 4 Claw Solitaire with Flat Band and Cathedral Setting Engagement Ring',
    'Timeless in design, Georgia is a round solitaire engagement ring with four round claws and a beautiful cathedral setting. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-georgia';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-georgia-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/georgia/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/georgia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-georgia-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/georgia/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/georgia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-georgia-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/georgia/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/georgia/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-georgia-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-georgia-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-georgia-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-georgia-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-georgia-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-georgia-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-georgia-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-georgia-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-georgia-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-georgia-size-0', 1, v_id, 'D'),
      ('ring-georgia-size-1', 2, v_id, 'E'),
      ('ring-georgia-size-2', 3, v_id, 'F'),
      ('ring-georgia-size-3', 4, v_id, 'G'),
      ('ring-georgia-size-4', 5, v_id, 'H'),
      ('ring-georgia-size-5', 6, v_id, 'I'),
      ('ring-georgia-size-6', 7, v_id, 'J'),
      ('ring-georgia-size-7', 8, v_id, 'K'),
      ('ring-georgia-size-8', 9, v_id, 'L'),
      ('ring-georgia-size-9', 10, v_id, 'M'),
      ('ring-georgia-size-10', 11, v_id, 'N'),
      ('ring-georgia-size-11', 12, v_id, 'O'),
      ('ring-georgia-size-12', 13, v_id, 'P'),
      ('ring-georgia-size-13', 14, v_id, 'Q'),
      ('ring-georgia-size-14', 15, v_id, 'R'),
      ('ring-georgia-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-georgia-specs',
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
    'ring-gigi',
    'Gigi',
    'Gigi - Marquise 6 Claw Solitaire with Cigar Band and Hidden Halo Engagement Ring',
    'Gigi is a sophisticated 6-claw marquise solitaire defined by its thick cigar band, which offers a bold yet timelessly classic look. Complete with a sparkling hidden halo, this graceful engagement ring is available in both high and low setting heights. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-gigi';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-gigi-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/gigi/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/gigi/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-gigi-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/gigi/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/gigi/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-gigi-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/gigi/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/gigi/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-gigi-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-gigi-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-gigi-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-gigi-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-gigi-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-gigi-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-gigi-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-gigi-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-gigi-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-gigi-size-0', 1, v_id, 'D'),
      ('ring-gigi-size-1', 2, v_id, 'E'),
      ('ring-gigi-size-2', 3, v_id, 'F'),
      ('ring-gigi-size-3', 4, v_id, 'G'),
      ('ring-gigi-size-4', 5, v_id, 'H'),
      ('ring-gigi-size-5', 6, v_id, 'I'),
      ('ring-gigi-size-6', 7, v_id, 'J'),
      ('ring-gigi-size-7', 8, v_id, 'K'),
      ('ring-gigi-size-8', 9, v_id, 'L'),
      ('ring-gigi-size-9', 10, v_id, 'M'),
      ('ring-gigi-size-10', 11, v_id, 'N'),
      ('ring-gigi-size-11', 12, v_id, 'O'),
      ('ring-gigi-size-12', 13, v_id, 'P'),
      ('ring-gigi-size-13', 14, v_id, 'Q'),
      ('ring-gigi-size-14', 15, v_id, 'R'),
      ('ring-gigi-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-gigi-specs',
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
    'ring-ginny',
    'Ginny',
    'Ginny - Radiant 8 Claw Trilogy with Pear Side Stones and Pave Band Engagement Ring',
    'Ginny is an exquisite trilogy engagement ring showcasing a radiant cut centre stone and two pear side stones atop a cathedral 2/3 pavè band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'radiant'::enum_ring_shape,
    'trilogy'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-ginny';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-ginny-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ginny/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ginny/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-ginny-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ginny/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ginny/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-ginny-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ginny/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ginny/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ginny-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-ginny-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-ginny-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-ginny-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ginny-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-ginny-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ginny-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-ginny-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-ginny-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-ginny-size-0', 1, v_id, 'D'),
      ('ring-ginny-size-1', 2, v_id, 'E'),
      ('ring-ginny-size-2', 3, v_id, 'F'),
      ('ring-ginny-size-3', 4, v_id, 'G'),
      ('ring-ginny-size-4', 5, v_id, 'H'),
      ('ring-ginny-size-5', 6, v_id, 'I'),
      ('ring-ginny-size-6', 7, v_id, 'J'),
      ('ring-ginny-size-7', 8, v_id, 'K'),
      ('ring-ginny-size-8', 9, v_id, 'L'),
      ('ring-ginny-size-9', 10, v_id, 'M'),
      ('ring-ginny-size-10', 11, v_id, 'N'),
      ('ring-ginny-size-11', 12, v_id, 'O'),
      ('ring-ginny-size-12', 13, v_id, 'P'),
      ('ring-ginny-size-13', 14, v_id, 'Q'),
      ('ring-ginny-size-14', 15, v_id, 'R'),
      ('ring-ginny-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-ginny-specs',
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

