Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C70C97D69F1
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 25 Oct 2023 13:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234446AbjJYLWK (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 25 Oct 2023 07:22:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233782AbjJYLWJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Oct 2023 07:22:09 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1FA5132
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Oct 2023 04:22:06 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2c4fe37f166so79352051fa.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Oct 2023 04:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698232925; x=1698837725; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dwp8E74sI4tVBaqrgu+e8RzHTAWo0YSAPvz5KCe5hyQ=;
        b=aY07CGEIYA8zybKuO4KqyfbYe0+V0m3ih1/Mp8aNqLBEwpZhGwZbL1IkCxiW1RyUoK
         NdhfhGU5a7byOEXq9tN5DvTBVfouTZDZv9uHaH47eVbvaxM4fU2WTklwOe/v/IORSCM9
         renAg5q1HekURoFkVl8Okn5DdHlA5u08iCGhYaIXRDHrqklc2gkfoH25rCx8NuPzPlL8
         3t3gZKXjwKpQJJhLRqrFay1GnbNvFTImTAwV8kDmgD5+SdTcawFMkVKduS+LYAGbsZ8Y
         ch7M6mqaqwto/BYwKcH6XlX7bcHNWQTkZGKj1byZZuGjpkJl5Av2fsedBXU7Sq2sqgB8
         y6WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698232925; x=1698837725;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dwp8E74sI4tVBaqrgu+e8RzHTAWo0YSAPvz5KCe5hyQ=;
        b=WR2A3ITcR/znmLf/rGIskY0HhGvAN6EaBHf8P/gZiJA95hHv4TlbwhOe0oxUYV2/Ks
         cbJyiVs1+JKU90MtD6/pLGKPY+8ylnInjLadzL7l/wg0Hk7oMVc1nzyDchdLWyIXCnfi
         crWumFj4g95By1/Fs2RobXEl4Xh+fhO4TtFJsLaOQ0fY0dM7Qwg4fupLB/VS0HrgnGmR
         be6scXZDirvQ0Mn37XXaVub4U9hIvceu4Tui3QdDBTi+d0MKNbvyk3HmCSpT/2bH6+uX
         VBfC/ZHqSJy3Wx/nazaQdZ1nwxyBDm6UzjweRg071y+wGSMGAwK3/z8zt3m4rFBEeKog
         F1tQ==
X-Gm-Message-State: AOJu0YziZcjb+ZkEcm6Zdlz+0W/HC1t2ew/+Zk/joo+5Xt+L1mR5Ae3b
        rQ7HrBZ5/zYPsFWDOpnOZdT7ug==
X-Google-Smtp-Source: AGHT+IFlEL56ocYJgKzp9u4zcIru0vmdc7o15SYfWmBqbz4xfgdTzW9qzGMVBhIZCBtLcMqtAQbTVA==
X-Received: by 2002:a05:651c:b20:b0:2c5:8a4:9e6f with SMTP id b32-20020a05651c0b2000b002c508a49e6fmr12089142ljr.37.1698232924963;
        Wed, 25 Oct 2023 04:22:04 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id o12-20020a05600c4fcc00b0040775501256sm14361794wmq.16.2023.10.25.04.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 04:22:04 -0700 (PDT)
Message-ID: <d6fdf664bd18eee581a2644e376124e830633045.camel@linaro.org>
Subject: Re: [PATCH v2] tty: serial: samsung_tty: remove dead code
From:   =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        alim.akhtar@samsung.com, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org
Date:   Wed, 25 Oct 2023 12:22:03 +0100
In-Reply-To: <20231024215509.ak4jbbahw2vsahs6@zenone.zhora.eu>
References: <20231019100901.4026680-1-andre.draszik@linaro.org>
         <20231024215509.ak4jbbahw2vsahs6@zenone.zhora.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4-1 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Andi,

On Tue, 2023-10-24 at 23:55 +0200, Andi Shyti wrote:
> Hi Andre,
>=20
> On Thu, Oct 19, 2023 at 11:09:01AM +0100, Andr=C3=A9 Draszik wrote:
> > When support for various old platforms was removed in commit
> > 1ea35b355722 ("ARM: s3c: remove s3c24xx specific hacks"),
> > s3c24xx_serial_ops also became unused here because nothing sets
> > port
> > type TYPE_S3C24XX anymore.
> >=20
> > Remove s3c24xx_serial_ops and all the code that's unreachable now.
> >=20
> > Fixes: 1ea35b355722 ("ARM: s3c: remove s3c24xx specific hacks")
>=20
> is this really a fix? Or is it a cleanup?

I guess from my position it's fixing the issue of dead code, introduced
in the commit referenced. Which is of course also a cleanup :-)

Not sure...

Cheers,
Andre

