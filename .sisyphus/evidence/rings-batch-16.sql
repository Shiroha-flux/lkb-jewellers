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