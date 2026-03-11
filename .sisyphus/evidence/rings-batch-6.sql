DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-aria',
    'Aria',
    'Aria - Round 6 Claw Solitaire with Wrap Around Hidden Halo Engagement Ring',
    'The Aria engagement ring features an exquisite round cut centre stone enclosed in six eagle-tipped claws and completed with a wrap-around hidden halo. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-aria';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-aria-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/aria/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/aria/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-aria-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/aria/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/aria/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-aria-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/aria/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/aria/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-aria-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-aria-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-aria-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-aria-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-aria-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-aria-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-aria-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-aria-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-aria-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-aria-size-0', 1, v_id, 'D'),
      ('ring-aria-size-1', 2, v_id, 'E'),
      ('ring-aria-size-2', 3, v_id, 'F'),
      ('ring-aria-size-3', 4, v_id, 'G'),
      ('ring-aria-size-4', 5, v_id, 'H'),
      ('ring-aria-size-5', 6, v_id, 'I'),
      ('ring-aria-size-6', 7, v_id, 'J'),
      ('ring-aria-size-7', 8, v_id, 'K'),
      ('ring-aria-size-8', 9, v_id, 'L'),
      ('ring-aria-size-9', 10, v_id, 'M'),
      ('ring-aria-size-10', 11, v_id, 'N'),
      ('ring-aria-size-11', 12, v_id, 'O'),
      ('ring-aria-size-12', 13, v_id, 'P'),
      ('ring-aria-size-13', 14, v_id, 'Q'),
      ('ring-aria-size-14', 15, v_id, 'R'),
      ('ring-aria-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-aria-specs',
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
    'ring-arielle',
    'Arielle',
    'Arielle - Oval 4 Claw Solitaire with Sunburst Halo and Cathedral Setting Engagement Ring',
    'Utterly unique in its design, Arielle is a beautiful oval halo engagement ring featuring round claws and a sweeping cathedral setting. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-arielle';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-arielle-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/arielle/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/arielle/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-arielle-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/arielle/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/arielle/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-arielle-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/arielle/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/arielle/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-arielle-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-arielle-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-arielle-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-arielle-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-arielle-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-arielle-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-arielle-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-arielle-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-arielle-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-arielle-size-0', 1, v_id, 'D'),
      ('ring-arielle-size-1', 2, v_id, 'E'),
      ('ring-arielle-size-2', 3, v_id, 'F'),
      ('ring-arielle-size-3', 4, v_id, 'G'),
      ('ring-arielle-size-4', 5, v_id, 'H'),
      ('ring-arielle-size-5', 6, v_id, 'I'),
      ('ring-arielle-size-6', 7, v_id, 'J'),
      ('ring-arielle-size-7', 8, v_id, 'K'),
      ('ring-arielle-size-8', 9, v_id, 'L'),
      ('ring-arielle-size-9', 10, v_id, 'M'),
      ('ring-arielle-size-10', 11, v_id, 'N'),
      ('ring-arielle-size-11', 12, v_id, 'O'),
      ('ring-arielle-size-12', 13, v_id, 'P'),
      ('ring-arielle-size-13', 14, v_id, 'Q'),
      ('ring-arielle-size-14', 15, v_id, 'R'),
      ('ring-arielle-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-arielle-specs',
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
    'ring-arlo',
    'Arlo',
    'Arlo - Oval 4 Claw Solitaire with Bezel Frame and East West Setting Engagement Ring',
    'Designed to be worn low set, the Arlo is an east west oval cut solitaire that blends vintage character with sculptural modern design for an effortlessly elevated silhouette that features a subtle under bezel frame and our signature eagle claws, offering the perfect balance for those torn between a bezel and a claw setting. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-arlo';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-arlo-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/arlo/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/arlo/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-arlo-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/arlo/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/arlo/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-arlo-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/arlo/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/arlo/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-arlo-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-arlo-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-arlo-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-arlo-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-arlo-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-arlo-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-arlo-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-arlo-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-arlo-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-arlo-size-0', 1, v_id, 'D'),
      ('ring-arlo-size-1', 2, v_id, 'E'),
      ('ring-arlo-size-2', 3, v_id, 'F'),
      ('ring-arlo-size-3', 4, v_id, 'G'),
      ('ring-arlo-size-4', 5, v_id, 'H'),
      ('ring-arlo-size-5', 6, v_id, 'I'),
      ('ring-arlo-size-6', 7, v_id, 'J'),
      ('ring-arlo-size-7', 8, v_id, 'K'),
      ('ring-arlo-size-8', 9, v_id, 'L'),
      ('ring-arlo-size-9', 10, v_id, 'M'),
      ('ring-arlo-size-10', 11, v_id, 'N'),
      ('ring-arlo-size-11', 12, v_id, 'O'),
      ('ring-arlo-size-12', 13, v_id, 'P'),
      ('ring-arlo-size-13', 14, v_id, 'Q'),
      ('ring-arlo-size-14', 15, v_id, 'R'),
      ('ring-arlo-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-arlo-specs',
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
    'ring-ashlea',
    'Ashlea',
    'Ashlea - Round 4 Claw Solitaire with Hidden Halo, Pave Band and Cathedral Setting Engagement Ring',
    'Ashlea is an elegant round solitaire design accentuated by a sweeping cathedral setting, dazzling hidden halo and 2/3 pavé band. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-ashlea';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-ashlea-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ashlea/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ashlea/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-ashlea-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ashlea/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ashlea/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-ashlea-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ashlea/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ashlea/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ashlea-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-ashlea-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-ashlea-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-ashlea-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ashlea-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-ashlea-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ashlea-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-ashlea-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-ashlea-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-ashlea-size-0', 1, v_id, 'D'),
      ('ring-ashlea-size-1', 2, v_id, 'E'),
      ('ring-ashlea-size-2', 3, v_id, 'F'),
      ('ring-ashlea-size-3', 4, v_id, 'G'),
      ('ring-ashlea-size-4', 5, v_id, 'H'),
      ('ring-ashlea-size-5', 6, v_id, 'I'),
      ('ring-ashlea-size-6', 7, v_id, 'J'),
      ('ring-ashlea-size-7', 8, v_id, 'K'),
      ('ring-ashlea-size-8', 9, v_id, 'L'),
      ('ring-ashlea-size-9', 10, v_id, 'M'),
      ('ring-ashlea-size-10', 11, v_id, 'N'),
      ('ring-ashlea-size-11', 12, v_id, 'O'),
      ('ring-ashlea-size-12', 13, v_id, 'P'),
      ('ring-ashlea-size-13', 14, v_id, 'Q'),
      ('ring-ashlea-size-14', 15, v_id, 'R'),
      ('ring-ashlea-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-ashlea-specs',
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
    'ring-aspen',
    'Aspen',
    'Aspen - Pear 5 Claw Solitaire with Tapered Band and Cathedral Setting Engagement Ring',
    'The Aspen engagement ring highlights a striking pear cut centre stone with five eagle-tipped claws and slim tapered band. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-aspen';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-aspen-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/aspen/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/aspen/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-aspen-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/aspen/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/aspen/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-aspen-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/aspen/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/aspen/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-aspen-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-aspen-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-aspen-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-aspen-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-aspen-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-aspen-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-aspen-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-aspen-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-aspen-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-aspen-size-0', 1, v_id, 'D'),
      ('ring-aspen-size-1', 2, v_id, 'E'),
      ('ring-aspen-size-2', 3, v_id, 'F'),
      ('ring-aspen-size-3', 4, v_id, 'G'),
      ('ring-aspen-size-4', 5, v_id, 'H'),
      ('ring-aspen-size-5', 6, v_id, 'I'),
      ('ring-aspen-size-6', 7, v_id, 'J'),
      ('ring-aspen-size-7', 8, v_id, 'K'),
      ('ring-aspen-size-8', 9, v_id, 'L'),
      ('ring-aspen-size-9', 10, v_id, 'M'),
      ('ring-aspen-size-10', 11, v_id, 'N'),
      ('ring-aspen-size-11', 12, v_id, 'O'),
      ('ring-aspen-size-12', 13, v_id, 'P'),
      ('ring-aspen-size-13', 14, v_id, 'Q'),
      ('ring-aspen-size-14', 15, v_id, 'R'),
      ('ring-aspen-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-aspen-specs',
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