Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B4967C6BAA
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 12 Oct 2023 12:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347145AbjJLK5L (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 12 Oct 2023 06:57:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343801AbjJLK5K (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 12 Oct 2023 06:57:10 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6D3BC0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Oct 2023 03:57:08 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-d9a4c0d89f7so869672276.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Oct 2023 03:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697108228; x=1697713028; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eXsH2wAbuu1LZ+xVuXFZUVdPOgCW2cpv03v3rr+MUKM=;
        b=HOM19ZedhaIEcq8oEbdJIjEKhWK8hLoy9tDKgnFBrrADp3LL9OO/pnIvaxGaGVbfHp
         ukltIpyLtM1V6X0x1UmtMGjWBRC+oGP2w8NMhxoC1S+8KnGzaZRHikSlBDMdDrWy3mBv
         faDsYYbutNkewVwQimrQZ8muEUUYovbv1NZtNmKS54J4JGbvHxIF3o5OD3u8gv5vEdth
         y0Yu2QxGYzcKEpAMqFjuWPB1HengGo1KU5GLw62NT60ZKTd3gJhuJ2aemT+L/QNSE2L/
         +/H61H8hM7KXeCPZhO9slcADzaFm6nFz4N6HiVzdlGM8F91uQaTEf0hgZbti5MGGyIJL
         DjIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697108228; x=1697713028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eXsH2wAbuu1LZ+xVuXFZUVdPOgCW2cpv03v3rr+MUKM=;
        b=HDjE88JnaBS+yKyuvdW9uInn0IYmn4w5EwJlF9ydPxAU0HjYFy9kMnhfljnXeCKVws
         IDTUjnKod6d29UMoUbQCFbrouMwXwYTjC/4L2RCusSgd8cMpoGWpyeF5VmJVt1Weyg4a
         EMo1/Y4wU05xX9GTtwxwm0XaNMNcvJAC+hZ1DIMGjPubuS+p2cceyNVt+HnDAIig4Qp2
         pxkJf5x0WU2aw2Ykoqk7XIiDJptzrXlybI2Wo466XaOf8YaUbwAPV13E81fiNIfPPWCs
         J2P/w0ghGK4O0a/NgftiRuIXx5lsAdYstckcRdzOQK+J/s7kW8T+/mAVT/sJNeWEIjNt
         GAJg==
X-Gm-Message-State: AOJu0YxJd/Yyjl1FoZoWlMvEMeMgXHrYFucHThboHTAI9ZlM/mYP5tYe
        rdmPRHV1AS75wpoY7UdJcbbr+CfVtQlJUYj/f1Ttzw==
X-Google-Smtp-Source: AGHT+IHoONc3hJii7RYcVkxb1UvFrk39Aq1j5ObRTTPqLaWzUuSZjNk8uWTkxQSzrzNgSo8ZjFPFsI+716xNwL6U+X0=
X-Received: by 2002:a25:d48:0:b0:d9a:4e29:6354 with SMTP id
 69-20020a250d48000000b00d9a4e296354mr8267648ybn.39.1697108228053; Thu, 12 Oct
 2023 03:57:08 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-5-peter.griffin@linaro.org> <CAPLW+4m4zUFfRWMo+KC1ymGAgHtbLxyx6L99Qd0vJYQXmmCvbw@mail.gmail.com>
In-Reply-To: <CAPLW+4m4zUFfRWMo+KC1ymGAgHtbLxyx6L99Qd0vJYQXmmCvbw@mail.gmail.com>
From:   Peter Griffin <peter.griffin@linaro.org>
Date:   Thu, 12 Oct 2023 11:56:56 +0100
Message-ID: <CADrjBPpgPKO49Ndtu=L30iqidpfZO8hUZKQrorZGzsb7tztDhg@mail.gmail.com>
Subject: Re: [PATCH v3 04/20] dt-bindings: watchdog: Document Google gs101 &
 gs201 watchdog bindings
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, saravanak@google.com,
        willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Sam,

Thanks for the review.

On Wed, 11 Oct 2023 at 23:58, Sam Protsenko <semen.protsenko@linaro.org> wr=
ote:
>
> On Wed, Oct 11, 2023 at 1:49=E2=80=AFPM Peter Griffin <peter.griffin@lina=
ro.org> wrote:
> >
> > Add the "google,gs101-wdt" and "google,gs201-wdt" compatibles to the
> > dt-schema documentation.
> >
> > gs101 SoC has two CPU clusters and each cluster has its own dedicated
> > watchdog timer (similar to exynos850 and exynosautov9 SoCs).
> >
> > These WDT instances are controlled using different bits in PMU
> > registers.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  .../devicetree/bindings/watchdog/samsung-wdt.yaml      | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yam=
l b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> > index 8fb6656ba0c2..67c8767f0499 100644
> > --- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> > +++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> > @@ -17,6 +17,8 @@ description: |+
> >  properties:
> >    compatible:
> >      enum:
> > +      - google,gs101-wdt                      # for Google gs101
> > +      - google,gs201-wdt                      # for Google gs201
> >        - samsung,s3c2410-wdt                   # for S3C2410
> >        - samsung,s3c6410-wdt                   # for S3C6410, S5PV210 a=
nd Exynos4
> >        - samsung,exynos5250-wdt                # for Exynos5250
> > @@ -42,13 +44,13 @@ properties:
> >    samsung,cluster-index:
> >      $ref: /schemas/types.yaml#/definitions/uint32
> >      description:
> > -      Index of CPU cluster on which watchdog is running (in case of Ex=
ynos850)
> > +      Index of CPU cluster on which watchdog is running (in case of Ex=
ynos850 or Google gsx01)
>
> Please stick to 80 characters per line when possible.

Will fix in v4.

Peter
