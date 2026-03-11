DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-kyla',
    'Kyla',
    'Kyla - Radiant Claw Solitaire with Marquise-Round Accent Stones and Wrap Around Hidden Halo Engagement Ring',
    'Kyla is a showstopping 4-claw radiant solitaire design with the extra sparkle of a wrap-around hidden halo and distinct pattern of round and marquise cut accent stones placed along the band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'accents'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-kyla';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-kyla-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/kyla/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/kyla/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-kyla-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/kyla/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/kyla/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-kyla-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/kyla/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/kyla/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-kyla-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-kyla-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-kyla-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-kyla-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-kyla-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-kyla-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-kyla-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-kyla-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-kyla-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-kyla-size-0', 1, v_id, 'D'),
      ('ring-kyla-size-1', 2, v_id, 'E'),
      ('ring-kyla-size-2', 3, v_id, 'F'),
      ('ring-kyla-size-3', 4, v_id, 'G'),
      ('ring-kyla-size-4', 5, v_id, 'H'),
      ('ring-kyla-size-5', 6, v_id, 'I'),
      ('ring-kyla-size-6', 7, v_id, 'J'),
      ('ring-kyla-size-7', 8, v_id, 'K'),
      ('ring-kyla-size-8', 9, v_id, 'L'),
      ('ring-kyla-size-9', 10, v_id, 'M'),
      ('ring-kyla-size-10', 11, v_id, 'N'),
      ('ring-kyla-size-11', 12, v_id, 'O'),
      ('ring-kyla-size-12', 13, v_id, 'P'),
      ('ring-kyla-size-13', 14, v_id, 'Q'),
      ('ring-kyla-size-14', 15, v_id, 'R'),
      ('ring-kyla-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-kyla-specs',
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
    'ring-lara',
    'Lara',
    'Lara - Oval 4 Claw Solitaire with Hidden Halo and Twisted Alternating Pave Band Engagement Ring',
    'Lara is an elegant braided engagement ring displaying an interweaving half-circle of sleek pavé and polished metal, 4-claw oval cut centre stone and sparkling hidden halo. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-lara';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-lara-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/lara/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/lara/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-lara-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/lara/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/lara/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-lara-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/lara/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/lara/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-lara-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-lara-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-lara-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-lara-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-lara-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-lara-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-lara-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-lara-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-lara-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-lara-size-0', 1, v_id, 'D'),
      ('ring-lara-size-1', 2, v_id, 'E'),
      ('ring-lara-size-2', 3, v_id, 'F'),
      ('ring-lara-size-3', 4, v_id, 'G'),
      ('ring-lara-size-4', 5, v_id, 'H'),
      ('ring-lara-size-5', 6, v_id, 'I'),
      ('ring-lara-size-6', 7, v_id, 'J'),
      ('ring-lara-size-7', 8, v_id, 'K'),
      ('ring-lara-size-8', 9, v_id, 'L'),
      ('ring-lara-size-9', 10, v_id, 'M'),
      ('ring-lara-size-10', 11, v_id, 'N'),
      ('ring-lara-size-11', 12, v_id, 'O'),
      ('ring-lara-size-12', 13, v_id, 'P'),
      ('ring-lara-size-13', 14, v_id, 'Q'),
      ('ring-lara-size-14', 15, v_id, 'R'),
      ('ring-lara-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-lara-specs',
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
    'ring-leila',
    'Leila',
    'Leila - Marquise 6 Claw Solitaire with Cathedral Setting Engagement Ring',
    'Leila is a classic 6-claw marquise solitaire design with beautiful cathedral arches and a polished band. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-leila';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-leila-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/leila/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/leila/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-leila-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/leila/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/leila/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-leila-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/leila/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/leila/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-leila-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-leila-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-leila-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-leila-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-leila-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-leila-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-leila-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-leila-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-leila-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-leila-size-0', 1, v_id, 'D'),
      ('ring-leila-size-1', 2, v_id, 'E'),
      ('ring-leila-size-2', 3, v_id, 'F'),
      ('ring-leila-size-3', 4, v_id, 'G'),
      ('ring-leila-size-4', 5, v_id, 'H'),
      ('ring-leila-size-5', 6, v_id, 'I'),
      ('ring-leila-size-6', 7, v_id, 'J'),
      ('ring-leila-size-7', 8, v_id, 'K'),
      ('ring-leila-size-8', 9, v_id, 'L'),
      ('ring-leila-size-9', 10, v_id, 'M'),
      ('ring-leila-size-10', 11, v_id, 'N'),
      ('ring-leila-size-11', 12, v_id, 'O'),
      ('ring-leila-size-12', 13, v_id, 'P'),
      ('ring-leila-size-13', 14, v_id, 'Q'),
      ('ring-leila-size-14', 15, v_id, 'R'),
      ('ring-leila-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-leila-specs',
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
    'ring-leslie',
    'Leslie',
    'Leslie - Round Claw Solitaire with Hidden Halo, Opposing Marquise Accents and Cathedral High Setting Engagement Ring',
    'The Leslie engagement ring showcases a 4-claw round centre stone, illuminated by a hidden halo beneath. A refined cathedral setting gives height and presence, while opposing marquise-cut side stones taper delicately along the band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'accents'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-leslie';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-leslie-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/leslie/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/leslie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-leslie-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/leslie/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/leslie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-leslie-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/leslie/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/leslie/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-leslie-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-leslie-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-leslie-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-leslie-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-leslie-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-leslie-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-leslie-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-leslie-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-leslie-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-leslie-size-0', 1, v_id, 'D'),
      ('ring-leslie-size-1', 2, v_id, 'E'),
      ('ring-leslie-size-2', 3, v_id, 'F'),
      ('ring-leslie-size-3', 4, v_id, 'G'),
      ('ring-leslie-size-4', 5, v_id, 'H'),
      ('ring-leslie-size-5', 6, v_id, 'I'),
      ('ring-leslie-size-6', 7, v_id, 'J'),
      ('ring-leslie-size-7', 8, v_id, 'K'),
      ('ring-leslie-size-8', 9, v_id, 'L'),
      ('ring-leslie-size-9', 10, v_id, 'M'),
      ('ring-leslie-size-10', 11, v_id, 'N'),
      ('ring-leslie-size-11', 12, v_id, 'O'),
      ('ring-leslie-size-12', 13, v_id, 'P'),
      ('ring-leslie-size-13', 14, v_id, 'Q'),
      ('ring-leslie-size-14', 15, v_id, 'R'),
      ('ring-leslie-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-leslie-specs',
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
    'ring-lexie',
    'Lexie',
    'Lexie - Statement Oval Bezel Solitaire with Open Cathedral Setting Engagement Ring',
    'Lexie is a striking bezel-set oval solitaire, graced with elegant cathedral arches to accentuate the brilliance of this raised centre stone. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-lexie';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-lexie-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/lexie/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/lexie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-lexie-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/lexie/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/lexie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-lexie-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/lexie/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/lexie/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-lexie-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-lexie-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-lexie-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-lexie-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-lexie-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-lexie-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-lexie-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-lexie-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-lexie-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-lexie-size-0', 1, v_id, 'D'),
      ('ring-lexie-size-1', 2, v_id, 'E'),
      ('ring-lexie-size-2', 3, v_id, 'F'),
      ('ring-lexie-size-3', 4, v_id, 'G'),
      ('ring-lexie-size-4', 5, v_id, 'H'),
      ('ring-lexie-size-5', 6, v_id, 'I'),
      ('ring-lexie-size-6', 7, v_id, 'J'),
      ('ring-lexie-size-7', 8, v_id, 'K'),
      ('ring-lexie-size-8', 9, v_id, 'L'),
      ('ring-lexie-size-9', 10, v_id, 'M'),
      ('ring-lexie-size-10', 11, v_id, 'N'),
      ('ring-lexie-size-11', 12, v_id, 'O'),
      ('ring-lexie-size-12', 13, v_id, 'P'),
      ('ring-lexie-size-13', 14, v_id, 'Q'),
      ('ring-lexie-size-14', 15, v_id, 'R'),
      ('ring-lexie-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-lexie-specs',
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