Return-Path: <linux-samsung-soc+bounces-931-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C5682710A
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  8 Jan 2024 15:22:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 159FD1F22FE3
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  8 Jan 2024 14:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC7146427;
	Mon,  8 Jan 2024 14:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BY82WmJr"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8A146556
	for <linux-samsung-soc@vger.kernel.org>; Mon,  8 Jan 2024 14:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-67fe0210665so11757596d6.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Jan 2024 06:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704723635; x=1705328435; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EHPjKZvqaVUgCPDWo115UGnb9Gx7ydX+36Jn9aorY8Q=;
        b=BY82WmJrWoYYkJAl3VIfmiREqbDHcJ+GlyhJhwHKqa7SwihVtF3xijj91/BM650FSx
         8Ovg3PPCZxwl9PfF9caG0u/ZRyD2YjM3S3UNfV4oS2nzaeifV5xAYyY8l0YgIK79+Cn1
         5M297SL325MrBDEjKJsmFUMbhFnlEjVLAZ1fV31q6b3vfiehD2fsQ5I8H2Z+WTLsLq1N
         Vf4NHbXekd0tmkYUzN+q0Ydw2v3EF6ZZR2cndP8mW9SXeqRIJdmx0ZRQwzxQhSgsQoPZ
         CUqsgbZS9ieFeWUQDz7WyrJOlNR7A2kT8TCWcAiDGSsZkcV4Tx4SImeXpg9g349hDFy5
         QFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704723635; x=1705328435;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EHPjKZvqaVUgCPDWo115UGnb9Gx7ydX+36Jn9aorY8Q=;
        b=U3TPFpVDbWlKYwXGhSkYOw0ooFcFDAqsCzErVJjFFHiHs5LAwQOz7rOSNHsSkVspvF
         C/smmc23uq2zrxijSuL9t0AM9ECOs3GzBdRWSh6NUTYyRzqeVIXaJNah2ZPMlzLymq9U
         N5ei4Vm9G6M/bq5H/sGwXgGTHoGRsTdaNQRgO3RxV9jFCKVOp5H5yp9EfmYiVm/07fXd
         Out6MJfkV1f+v+VbZRLNPR73FTQ4rUxwT+HmsoiTHTr2iJUzKsv9A46n2B9a+MkwW36X
         cR/jgWQdXr1jpwWe/CCb3V06fehBYFb6p8+FdyPZTvaMUeXQYvB9p0JXXvoM2dyQxDW9
         5Ckg==
X-Gm-Message-State: AOJu0YyA1JGSqvhMY9ivEeGUConTUZo/bvZXgtFnzUYybdq5tp0I8UQR
	uBc8qTrWy+9yiP/mQsd0oprwIpid1druh6dcnjTur3Ts9vyXZw==
X-Google-Smtp-Source: AGHT+IEXe4ZOFOtiuG815eIIL+sH4z4cDlfwnD79RCSo8KfcQVtGH26iaTCEMOjh44nXGjzl36Omhh0sKsCQcVoORtY=
X-Received: by 2002:ad4:5ba5:0:b0:67a:b0a5:843c with SMTP id
 5-20020ad45ba5000000b0067ab0a5843cmr3501275qvq.58.1704723634719; Mon, 08 Jan
 2024 06:20:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231228125805.661725-1-tudor.ambarus@linaro.org> <20231228125805.661725-3-tudor.ambarus@linaro.org>
In-Reply-To: <20231228125805.661725-3-tudor.ambarus@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 8 Jan 2024 14:20:23 +0000
Message-ID: <CADrjBPrJM7GY4fgfrC+5OQw3MtMOTMSg8gh2xyES10vQrP4J+A@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] dt-bindings: i2c: exynos5: add
 google,gs101-hsi2c compatible
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, sboyd@kernel.org, conor+dt@kernel.org, 
	andi.shyti@kernel.org, alim.akhtar@samsung.com, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com, 
	cw00.choi@samsung.com, arnd@arndb.de, semen.protsenko@linaro.org, 
	andre.draszik@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-serial@vger.kernel.org, kernel-team@android.com, 
	Wolfram Sang <wsa@kernel.org>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Tudor,

On Thu, 28 Dec 2023 at 12:58, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> Add google,gs101-hsi2c dedicated compatible for representing
> I2C of Google GS101 SoC.
>
> Acked-by: Wolfram Sang <wsa@kernel.org>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

