Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 553684EB1A0
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 29 Mar 2022 18:13:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239514AbiC2QPK (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 29 Mar 2022 12:15:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239482AbiC2QPJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 29 Mar 2022 12:15:09 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15BFC6341
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Mar 2022 09:13:24 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id n63-20020a1c2742000000b0038d0c31db6eso1802482wmn.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Mar 2022 09:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=YTxP7HWRQagvLol49w9U8StQxxwKyv5+VjuLHJHzNBc=;
        b=xaD4Og1Xqqt/c+vuuNvNvPRGz0QjW7LfiuaJLGgqojn5KiEeGmfbb9hX5Iqw9D1QCv
         cbLo+8LQFk0quq/KXtXrPEZ3Ae+H573+RMGNPXj/dBVwmge/E08j10ZXwiTksoj/nZ1+
         JF/PjAU/rYfvs2ZkDWTK2X1iv+I3ioS0ZSNgsWvkOuU2CyY+72Lc3Vw1s81OI/NB+HUQ
         /NPpwTIKSCqCzIietzPRRCn+3Z3aKCz1jFRKoAiiocpXHH7xZE8iz3yIVpUlukDFpOhl
         FGU5m1kuJL9YmBczNFSXf6jjtID0BkoU4ys0izSF9lL9NqWPVc0qI7hZicay4HQ6Efvn
         aGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=YTxP7HWRQagvLol49w9U8StQxxwKyv5+VjuLHJHzNBc=;
        b=3ND2RlE6XlGqY29U5DBtUN2cqQ7WRiywf1dnteTJNSm7F1TIJA9FQIZsmLZdqjJe1J
         TV5AvujDrcvhvJeCjdA3DqwGwFjaQo7WNfrnHgmHNhH/IIz+kTUksQl10SrDSf8CIW9O
         uPY+t9eaKu/ccN8dBSUroTI/MzFcc1Hj8sMn7sNBeU6A38QqM79li1uo2lanWHdEibYF
         cCpFXTF6esIQMjgJbfNGZF9fNLKHeWTgONOcoklEz3K/qAMLYGSHPnDw71dKm4qd+QjN
         PLKxhtfkxOE8qhCYzWQk4lTuIWluDdyrtxQDzal00Uf0vcJXe9co4yzwcrSVdgjE+UT6
         dB1A==
X-Gm-Message-State: AOAM531V8trc/ZOAVkwFGF9X6zXJiC4QSOQ6M9+mayplU0g0hWOmwt8x
        HuPl+5H/OgTWdgx5KsCfm5tqhg==
X-Google-Smtp-Source: ABdhPJxNC8QU4RkF7zsoVybBcs79idtSW/nKBSrMwv6YVnFFHPw6flf9Pyqw6kxzux0CMOPDesy1PQ==
X-Received: by 2002:a05:600c:4e8a:b0:380:e340:bfba with SMTP id f10-20020a05600c4e8a00b00380e340bfbamr542917wmq.80.1648570402437;
        Tue, 29 Mar 2022 09:13:22 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:a663:978b:3ffb:7dc3? ([2001:861:44c0:66c0:a663:978b:3ffb:7dc3])
        by smtp.gmail.com with ESMTPSA id q16-20020adff950000000b00205aa05fa03sm11025699wrr.58.2022.03.29.09.13.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Mar 2022 09:13:21 -0700 (PDT)
Message-ID: <94e888fe-d8fc-5379-302f-66d64f2ae10b@baylibre.com>
Date:   Tue, 29 Mar 2022 18:13:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 09/13] pinctrl: meson: Rename REG_* to MREG_*
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Qianggui Song <qianggui.song@amlogic.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
 <20220329152926.50958-10-andriy.shevchenko@linux.intel.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220329152926.50958-10-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 29/03/2022 17:29, Andy Shevchenko wrote:
> Rename REG_* to MREG_* as a prerequisite for enabling COMPILE_TEST.

What error do you hit ?

MREG_ is rather ugly, something like PINCONF_REG_ or more simpler MESON_REG_ would be more appropriate.

Neil

> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/pinctrl/meson/pinctrl-meson.c | 24 ++++++++++++------------
>   drivers/pinctrl/meson/pinctrl-meson.h | 24 ++++++++++++------------
>   2 files changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
> index 49851444a6e3..64da61ba2bb9 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
> @@ -218,13 +218,13 @@ static int meson_pinconf_set_output(struct meson_pinctrl *pc,
>   				    unsigned int pin,
>   				    bool out)
>   {
> -	return meson_pinconf_set_gpio_bit(pc, pin, REG_DIR, !out);
> +	return meson_pinconf_set_gpio_bit(pc, pin, MREG_DIR, !out);
>   }
>   
>   static int meson_pinconf_get_output(struct meson_pinctrl *pc,
>   				    unsigned int pin)
>   {
> -	int ret = meson_pinconf_get_gpio_bit(pc, pin, REG_DIR);
> +	int ret = meson_pinconf_get_gpio_bit(pc, pin, MREG_DIR);
>   
>   	if (ret < 0)
>   		return ret;
> @@ -236,13 +236,13 @@ static int meson_pinconf_set_drive(struct meson_pinctrl *pc,
>   				   unsigned int pin,
>   				   bool high)
>   {
> -	return meson_pinconf_set_gpio_bit(pc, pin, REG_OUT, high);
> +	return meson_pinconf_set_gpio_bit(pc, pin, MREG_OUT, high);
>   }
>   
>   static int meson_pinconf_get_drive(struct meson_pinctrl *pc,
>   				   unsigned int pin)
>   {
> -	return meson_pinconf_get_gpio_bit(pc, pin, REG_OUT);
> +	return meson_pinconf_get_gpio_bit(pc, pin, MREG_OUT);
>   }
>   
>   static int meson_pinconf_set_output_drive(struct meson_pinctrl *pc,
> @@ -269,7 +269,7 @@ static int meson_pinconf_disable_bias(struct meson_pinctrl *pc,
>   	if (ret)
>   		return ret;
>   
> -	meson_calc_reg_and_bit(bank, pin, REG_PULLEN, &reg, &bit);
> +	meson_calc_reg_and_bit(bank, pin, MREG_PULLEN, &reg, &bit);
>   	ret = regmap_update_bits(pc->reg_pullen, reg, BIT(bit), 0);
>   	if (ret)
>   		return ret;
> @@ -288,7 +288,7 @@ static int meson_pinconf_enable_bias(struct meson_pinctrl *pc, unsigned int pin,
>   	if (ret)
>   		return ret;
>   
> -	meson_calc_reg_and_bit(bank, pin, REG_PULL, &reg, &bit);
> +	meson_calc_reg_and_bit(bank, pin, MREG_PULL, &reg, &bit);
>   	if (pull_up)
>   		val = BIT(bit);
>   
> @@ -296,7 +296,7 @@ static int meson_pinconf_enable_bias(struct meson_pinctrl *pc, unsigned int pin,
>   	if (ret)
>   		return ret;
>   
> -	meson_calc_reg_and_bit(bank, pin, REG_PULLEN, &reg, &bit);
> +	meson_calc_reg_and_bit(bank, pin, MREG_PULLEN, &reg, &bit);
>   	ret = regmap_update_bits(pc->reg_pullen, reg, BIT(bit),	BIT(bit));
>   	if (ret)
>   		return ret;
> @@ -321,7 +321,7 @@ static int meson_pinconf_set_drive_strength(struct meson_pinctrl *pc,
>   	if (ret)
>   		return ret;
>   
> -	meson_calc_reg_and_bit(bank, pin, REG_DS, &reg, &bit);
> +	meson_calc_reg_and_bit(bank, pin, MREG_DS, &reg, &bit);
>   
>   	if (drive_strength_ua <= 500) {
>   		ds_val = MESON_PINCONF_DRV_500UA;
> @@ -407,7 +407,7 @@ static int meson_pinconf_get_pull(struct meson_pinctrl *pc, unsigned int pin)
>   	if (ret)
>   		return ret;
>   
> -	meson_calc_reg_and_bit(bank, pin, REG_PULLEN, &reg, &bit);
> +	meson_calc_reg_and_bit(bank, pin, MREG_PULLEN, &reg, &bit);
>   
>   	ret = regmap_read(pc->reg_pullen, reg, &val);
>   	if (ret)
> @@ -416,7 +416,7 @@ static int meson_pinconf_get_pull(struct meson_pinctrl *pc, unsigned int pin)
>   	if (!(val & BIT(bit))) {
>   		conf = PIN_CONFIG_BIAS_DISABLE;
>   	} else {
> -		meson_calc_reg_and_bit(bank, pin, REG_PULL, &reg, &bit);
> +		meson_calc_reg_and_bit(bank, pin, MREG_PULL, &reg, &bit);
>   
>   		ret = regmap_read(pc->reg_pull, reg, &val);
>   		if (ret)
> @@ -447,7 +447,7 @@ static int meson_pinconf_get_drive_strength(struct meson_pinctrl *pc,
>   	if (ret)
>   		return ret;
>   
> -	meson_calc_reg_and_bit(bank, pin, REG_DS, &reg, &bit);
> +	meson_calc_reg_and_bit(bank, pin, MREG_DS, &reg, &bit);
>   
>   	ret = regmap_read(pc->reg_ds, reg, &val);
>   	if (ret)
> @@ -595,7 +595,7 @@ static int meson_gpio_get(struct gpio_chip *chip, unsigned gpio)
>   	if (ret)
>   		return ret;
>   
> -	meson_calc_reg_and_bit(bank, gpio, REG_IN, &reg, &bit);
> +	meson_calc_reg_and_bit(bank, gpio, MREG_IN, &reg, &bit);
>   	regmap_read(pc->reg_gpio, reg, &val);
>   
>   	return !!(val & BIT(bit));
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
> index ff5372e0a475..c00d9ad27843 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.h
> +++ b/drivers/pinctrl/meson/pinctrl-meson.h
> @@ -63,12 +63,12 @@ struct meson_reg_desc {
>    * enum meson_reg_type - type of registers encoded in @meson_reg_desc
>    */
>   enum meson_reg_type {
> -	REG_PULLEN,
> -	REG_PULL,
> -	REG_DIR,
> -	REG_OUT,
> -	REG_IN,
> -	REG_DS,
> +	MREG_PULLEN,
> +	MREG_PULL,
> +	MREG_DIR,
> +	MREG_OUT,
> +	MREG_IN,
> +	MREG_DS,
>   	NUM_REG,
>   };
>   
> @@ -150,12 +150,12 @@ struct meson_pinctrl {
>   		.irq_first	= fi,					\
>   		.irq_last	= li,					\
>   		.regs = {						\
> -			[REG_PULLEN]	= { per, peb },			\
> -			[REG_PULL]	= { pr, pb },			\
> -			[REG_DIR]	= { dr, db },			\
> -			[REG_OUT]	= { or, ob },			\
> -			[REG_IN]	= { ir, ib },			\
> -			[REG_DS]	= { dsr, dsb },			\
> +			[MREG_PULLEN]	= { per, peb },			\
> +			[MREG_PULL]	= { pr, pb },			\
> +			[MREG_DIR]	= { dr, db },			\
> +			[MREG_OUT]	= { or, ob },			\
> +			[MREG_IN]	= { ir, ib },			\
> +			[MREG_DS]	= { dsr, dsb },			\
>   		},							\
>   	 }
>   

