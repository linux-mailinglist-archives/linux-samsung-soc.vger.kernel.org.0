Return-Path: <linux-samsung-soc+bounces-1017-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F91482F3FF
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 16 Jan 2024 19:19:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 505EB289199
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 16 Jan 2024 18:19:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE69B1CD27;
	Tue, 16 Jan 2024 18:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j+Uiei5A"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C181CF9C
	for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Jan 2024 18:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705429121; cv=none; b=oM9gwGaGulGi+bvmoVY7hEWFhibsmplp8ataJhna/A7PpVKAoB2DE/f6BMVLuQGUEvNp4LednV+gCTVInSly4gkWKg/Of1skKUh+rr/MYzs+RthKj9PsRyBGlm8Og+guYI225c2vp088TmNibdb7XYN00Jmg4zNk++ZfDCop2ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705429121; c=relaxed/simple;
	bh=9LCtHhuBxXswmvcVt20Vs3SsXEZWkZxwdcjfucQiMgM=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=tYnbVL8fz8qHQOzz4JXmodjX7i1qlyTW/Cn27pp6Ke+AamrhNQufgoXSXcYfw83qRaUfc/nsVnGEYM2exkfamf4QewlP/cugIYcho5InezvZ+YV6dgynZaX6wTRB9wjp5Rj7CxJamN0iX5qoDzUXei6zqQpJJSIQaNLO0hUUSFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j+Uiei5A; arc=none smtp.client-ip=209.85.214.177
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d3f29fea66so57627765ad.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Jan 2024 10:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705429120; x=1706033920; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CAhjgUfJByTS52hcNwXo1XRbsYtHCOeab0hYvWz4vCc=;
        b=j+Uiei5AD7qe8SFinb1i4uze6GeheuG7zuf1OLs05nuw4HbkxEanAuGSeNW+UYNIXf
         imjh+cyTGasUMp/4Kh6f7Xcucv60vTSur4Udb0aDMD6o/RyhDLKuB0BmZDtQwSnoezXW
         Qjclz/uKPHLjpciLOKI1t8G7voBF4mnylvp3s8sjfGzWbYcil1eASXJkizO6J/lela/H
         o8JiXXdDntj8gF1omf1hgblKIL9MPYKH/RC2cICOXRf6RKT8J4JKXzNep4806HgwLW7v
         cbNvlq5dtuhPFh0eLwYio2XsHgsDXKcq03udKkKIo6odkWETCZXrNLfFTW3zY+qy+NVc
         QO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705429120; x=1706033920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CAhjgUfJByTS52hcNwXo1XRbsYtHCOeab0hYvWz4vCc=;
        b=ENJAu9oOxoOpyHpts25Fd+wLT7OsXMYaUCLoyxjsYwVRwzzezkqVtkJO9hK2i62/vM
         OwkNJdwbP3+wgYNrcJPzNVQ2b3Y6lHeTm1DIuplVDF7cx6Ud1w9C4C6b+WU6TyOHlHC6
         7nhgsnjovzBZZJB+rpGYeYj1frKOzRe1fpNS/QHTHLWNHetbuZZhkTTLVtKTlYzAvGNt
         zQq3EuSAuSjRIGSjICf0LGjJyZxzD6Mm8WSI2vMV1EuvR8QDiwP4NCzNr2LjD5ioTk9U
         Gn+XGZurzMQ6nyfNZswZrXAeOc4EqGogujENGF1fC4niOSpXaA/O1m8HJeb1zGzux4z7
         udVg==
X-Gm-Message-State: AOJu0YxJSgT92Ttkx4VLNQxdhMfM4AY/JFh0O3cNyqZZuZidwKUrmrxS
	K4gr1v7hCqxJldpqV6Yl/Zhdv0U7mwZgjVm8j7TrirFrIyQ9rQ==
X-Google-Smtp-Source: AGHT+IEfexzqZKM1MUiibGWNM+CK1iYq5GFuz8TAA9Jxp0kMBk0KePbVvTge5xjyIEdLfYcwiesHqxPs1kRT46+thsI=
X-Received: by 2002:a17:902:f68f:b0:1d4:2f1c:825a with SMTP id
 l15-20020a170902f68f00b001d42f1c825amr5323807plg.102.1705429119955; Tue, 16
 Jan 2024 10:18:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240110102102.61587-1-tudor.ambarus@linaro.org> <20240110102102.61587-10-tudor.ambarus@linaro.org>
In-Reply-To: <20240110102102.61587-10-tudor.ambarus@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 16 Jan 2024 12:18:28 -0600
Message-ID: <CAPLW+4nJALwC=ri-jgOWktkd74xJoGyYPeGvf1sY_tjYX_40wg@mail.gmail.com>
Subject: Re: [PATCH 09/18] tty: serial: samsung: drop superfluous comment
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	andre.draszik@linaro.org, peter.griffin@linaro.org, kernel-team@android.com, 
	willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 10, 2024 at 4:23=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
> The comment brings no benefit as we can already see from the method's
> name, ``s3c24xx_serial_pm``, that it deals with power management.
> Drop the superfluous comment.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/tty/serial/samsung_tty.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsun=
g_tty.c
> index b9d1ef67468c..90c49197efc7 100644
> --- a/drivers/tty/serial/samsung_tty.c
> +++ b/drivers/tty/serial/samsung_tty.c
> @@ -1296,8 +1296,6 @@ static int apple_s5l_serial_startup(struct uart_por=
t *port)
>         return ret;
>  }
>
> -/* power power management control */
> -
>  static void s3c24xx_serial_pm(struct uart_port *port, unsigned int level=
,
>                               unsigned int old)
>  {
> --
> 2.43.0.472.g3155946c3a-goog
>
>

