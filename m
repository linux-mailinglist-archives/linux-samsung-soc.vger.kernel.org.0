Return-Path: <linux-samsung-soc+bounces-1039-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E26A830AB1
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 17 Jan 2024 17:13:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB0A728BD93
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 17 Jan 2024 16:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 656B1224DF;
	Wed, 17 Jan 2024 16:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VJtyq7rU"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB2822319
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Jan 2024 16:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705507911; cv=none; b=YL6/k+txZyF+D+/FGWZHC1/5S4kl8U1vQVmZbyouaGp4J3K1QUZSjtRMJmM5w8M0v8aP2aPYRLGCvY5hd+EHkKx5IDRGP8jrYw6IJr65FjWb7asiXULpTls3mM1d27mb8B5N5pS9aSCi0o/3emaGaZ0pVKOUjWThTFaGZsGs37k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705507911; c=relaxed/simple;
	bh=dQUa+ynEVxPBJ1mLZg+emq2IoeEU/beREy4ePffoRTA=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=OLoocv25dhqqxCZyPMKfvKujHTc0OJgVr1kew1RUGPo5nmuvHG8uaT6Wou7xht6Hwy/s3Cua4mo85ljs3KOtiyzCFXw0lxawTXYM5HljvGVFG29PGFCb6d2ZctIQuxgmJY1snmMALfaMXaiH10V66fAmpQTfy/LewjgiysHZCVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VJtyq7rU; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-28e7a750025so1358790a91.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Jan 2024 08:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705507908; x=1706112708; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=drJWjvb+yQYbOubeqxcSCSSS8No8nI+honzyTfQXeuM=;
        b=VJtyq7rUFgrt0k2pMwGAT+VOygyyxm79vszaYbcwAgera96aijYqrtjXp+EON8HxyI
         0Q8EotMW5THkk7NSzy1hH0bkPwY7zP1onEnCygKFE9ZMlH1vlR3/9wSiB+gVXOc3nUfA
         BVgF499nHkHUV73Pxn89sBn/Rrfq39fFfmw4Krq7iO9C97QXC+PmYOEmm+GyJaSvWIhT
         flJXKq5a77K3Th0q4nx6YNvYF7sazyRhBULlovkqNqXQ6YIRNIY745T1oiVjYhDfslEJ
         lipBiQQLznPFMvdajPT+/oSKYrfdW+QeLvQviFlIcAG5x1m3eVsDL+pfaEiAbpRRuvKZ
         10dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705507908; x=1706112708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=drJWjvb+yQYbOubeqxcSCSSS8No8nI+honzyTfQXeuM=;
        b=KbCYAs3ed3uLtr3PM7NWadh/Y6BN5eWXF6q54sjHoNiFqDuaBu8Nk5ahEADy3rQ77e
         VGliG02tkh/mErCtFCpUhCRkyayEgMNSdd+2pgTGdujWFdzEhCao83DVj9nNN49xYoKk
         LTga5uizHPf4V1AOzdoveYYYNPU+ReS2J1P0gl5Rju0436WvxrpspFFKFrz7Ahs4kV5+
         ehTEuO2l8ZsghCcVuQSWL/BopFl8n0F1b/XqoANqrsPZElvwcmMPuFkarZ+UleBU9J76
         Skg+8MpO3cGRPmpSJ/Mv+DMQIifWhtCvQhoMKSlHEd7vNzQ+o0FGAo9onqQGg5jTnsZW
         AxsA==
X-Gm-Message-State: AOJu0YzgINJO9bKj1q80Vk32xSa+XkiI4qxV/26lSNLOBXZ+B3YOI63T
	ayZBDXmO2NUrsn9g7l8zHUgvE+NWMTOpdB0od2l20uhEpujr6w==
X-Google-Smtp-Source: AGHT+IF/BkPqfcI7s6qu0WKHY8iBQUPv+9/611flmwtBk2+/CmUzDdGw9MwVL258kmnYaNPMuijP+jQO6OHgZTgpXiA=
X-Received: by 2002:a17:90b:1996:b0:28e:2d7e:7cd6 with SMTP id
 mv22-20020a17090b199600b0028e2d7e7cd6mr3076285pjb.14.1705507907883; Wed, 17
 Jan 2024 08:11:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240109125814.3691033-1-tudor.ambarus@linaro.org>
 <20240109125814.3691033-8-tudor.ambarus@linaro.org> <CAPLW+4=y12fBf47v_HKfBdHTsQJfWo2cwBuFosUKo3xPBqcKJw@mail.gmail.com>
 <f394e372-dbfd-4fd5-b5c8-23c383cb6cf2@linaro.org>
In-Reply-To: <f394e372-dbfd-4fd5-b5c8-23c383cb6cf2@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 17 Jan 2024 10:11:36 -0600
Message-ID: <CAPLW+4nc1GDJHZ=-+R1+aEAMzoU_OpAX37Ke84qqg66xbjC9eA@mail.gmail.com>
Subject: Re: [PATCH v3 07/12] clk: samsung: gs101: add support for cmu_peric0
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: peter.griffin@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
	gregkh@linuxfoundation.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh+dt@kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org, 
	alim.akhtar@samsung.com, jirislaby@kernel.org, s.nawrocki@samsung.com, 
	tomasz.figa@gmail.com, cw00.choi@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-serial@vger.kernel.org, andre.draszik@linaro.org, 
	kernel-team@android.com, willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 17, 2024 at 8:49=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
> Hi, Sam,
>
> Thanks for reviewing the series!
>
> On 1/16/24 17:42, Sam Protsenko wrote:
>
> cut
>
> >> Few clocks are marked as critical because when either of them is
> >> disabled, the system hangs even if their clock parents are enabled.
> >>
> >> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> >> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> >> ---
> cut
> >>
> >> diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk=
-gs101.c
> >> index 782993951fff..f3f0f5feb28d 100644
> >> --- a/drivers/clk/samsung/clk-gs101.c
> >> +++ b/drivers/clk/samsung/clk-gs101.c
>
> cut
>
> >> +static const struct samsung_gate_clock peric0_gate_clks[] __initconst=
 =3D {
> >> +       /* Disabling this clock makes the system hang. Mark the clock =
as critical. */
> >> +       GATE(CLK_GOUT_PERIC0_PERIC0_CMU_PERIC0_PCLK,
> >> +            "gout_peric0_peric0_cmu_peric0_pclk", "mout_peric0_bus_us=
er",
> >> +            CLK_CON_GAT_CLK_BLK_PERIC0_UID_PERIC0_CMU_PERIC0_IPCLKPOR=
T_PCLK,
> >> +            21, CLK_IS_CRITICAL, 0),
> > Why not just CLK_IGNORE_UNUSED? As I understand this gate clock can be
>
> When either of the clocks that I marked as critical is disabled, the
> system hangs, even if their clock parent is enabled. I tested this by
> enabling the clock debugfs with write permissions. I prepared-enabled
> the parent clock to increase their user count so that when the child
> gets disabled to not disable the parent as well. When disabling the
> child the system hung, even if its parent was enabled. Thus I considered
> that the child is critical. I mentioned this in the commit message as
> well. Please tell if get this wrong.
>

Ok, if you already tested this particular clock with CLK_IGNORE_UNUSED
and it didn't help:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

> > used to disable PCLK (bus clock) provided to the whole CMU_PERIC0.
> > Aren't there any valid cases for disabling this clock, like during
> > some PM transitions? For Exynos850 clock driver I marked all clocks of
>
> They aren't, because if one switches off any of these clocks that are
> marked as critical, the system hangs and it will not be able to resume.
>
> > this kind as CLK_IGNORE_UNUSED and it works fine. In other words: I'd
> > say CLK_IS_CRITICAL flag is more "strong" than CLK_IGNORE_UNUSED, and
> > requires better and more specific explanation, to make sure we are not
> > abusing it. And I'm not sure this is the case.
>
> Is the explanation from the commit message enough?
> >
> > The same goes for the rest of clocks marked as CLK_IS_CRITICAL in this
> > patch. Please check if maybe using CLK_IGNORE_UNUSED makes sense for
> > any of those as well.
>
> I've already checked and all behave as described above.
>
> Thanks,
> ta

