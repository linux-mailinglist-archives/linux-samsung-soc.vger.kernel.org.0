Return-Path: <linux-samsung-soc+bounces-1022-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB6182F4B3
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 16 Jan 2024 19:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA52628336B
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 16 Jan 2024 18:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 787961CFA4;
	Tue, 16 Jan 2024 18:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LPW1C0Gj"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323EF1CAA2
	for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Jan 2024 18:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705431299; cv=none; b=VWvHqefrsLbOLhH+lOv7rcaCMTcxrigYiWmbh5x4Rc8Gsyiwn7NFEwjOWyQjAdX61QDYsYMeFIt+WSTdAxdMT5yJAxpn4DbHEWQ8ZCtjaMGtmstSiGMOnPPlzzZvLRHPgWyfI4t0UHgpromluuLg9VmNn2b5hi0M20enr1sZ3hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705431299; c=relaxed/simple;
	bh=AcaArvIGHBhawjXJC5ECINtq4Y4+SY0odW2qhBtPErc=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=gy2HtcCJn+m27oyKWk77bGwURxznRoElsO4luscUQg0eHdKT5KR2tuSHlmmAce3Vg07JTNFPNLmWSW5CkIgiM3ihJ9IdkTnx2PhzZkeIh6BwtGEzU+Fl0O3YgYgPIEroxITHLPvnQg4rAKbDjRNY1PgrDxCLc+MG+VSlrpYseOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LPW1C0Gj; arc=none smtp.client-ip=209.85.216.46
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-28e4fd9e352so1797944a91.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Jan 2024 10:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705431296; x=1706036096; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKWI3GBw8XVmkGMp4kp5cBnwP168mn/eNzlkwz0VmsY=;
        b=LPW1C0GjQTtRBXCTSL8vE54wbRZcUF2FCm90doXtgvTocIfBhx8nuai4B2e+JaoUZL
         3OpOvfyQD+yHxNDECrJ2fNg0i8uzvC0tkdgyO6AEhyyqitrWIqNcsNi0ChuGhR98poom
         5CMy4AkPP8fCMU3EJ1lNmKVpObw0D3i5pquVN4/ZznWjccaxss7lCadAA6tRrYOJvxHA
         CmKf6mqWGhPTuVb+fOLJDZYGIaLWwIHf7jQuxoRDY8NzmRGbS1lzCEfGbMYQj5EHias3
         C+e4xhI/zZmERz0G2RXhGEkJJszvKQ4iluCoFTWBdQ2dDEAaZjYEwY22dcCpSSOQoFWx
         /Zng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705431296; x=1706036096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SKWI3GBw8XVmkGMp4kp5cBnwP168mn/eNzlkwz0VmsY=;
        b=Y5TOHg1QaA8kCtSos/j9JdnnOlwxqzpBy6SKdBozm9npOIARo7nUi0TM6kI9H8j1Cy
         hTmLrO9BFlP4DNi5RyqFN/ZIX/KKbR/BEcXhKLqJ1onRsAnaDfgQOzGX4ugTrNitDZDJ
         3+v2Xsx2pMN4mwFxYPa88NCIcqKRwNWC8wi4LlFo8cMwji11lXIKTFCb8xmHRglEG0NP
         QJYu0R1Y1MHAEr4V77xmQTircU92gLd1p/kj0Ea0tlC0eVl5qBzPo9RmlBRkpnbctzJ/
         NLD4L37rTuCYRJT8I3+JEWSkORCX9uCFBmWZXrK1yotviNbh764ffZlBUQVP88IAbuKS
         abUg==
X-Gm-Message-State: AOJu0YyjFvY+4pv1TjOm/DQa84QnA5MGMRl4gIC6WOibJJ5mS1DcnGB0
	0bxuu0Lk8Fvm2oJGSPTgRMv2JDbqeYHug71bF8gwe8nOMEFirw==
X-Google-Smtp-Source: AGHT+IEFtoFGlnGt6DKWSN181qFbFfM7zhz4boriHOhF5W2AqSgVEM830AlQr0zgGUviJ0so7F2IEofXyY64Nwjuneo=
X-Received: by 2002:a17:90a:3484:b0:28e:79a4:979c with SMTP id
 p4-20020a17090a348400b0028e79a4979cmr982068pjb.58.1705431296571; Tue, 16 Jan
 2024 10:54:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240110102102.61587-1-tudor.ambarus@linaro.org> <20240110102102.61587-15-tudor.ambarus@linaro.org>
In-Reply-To: <20240110102102.61587-15-tudor.ambarus@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 16 Jan 2024 12:54:45 -0600
Message-ID: <CAPLW+4=O2OaDsC7KNeLPt4UC-OLjD3_VVL1xL6PnrOBPUmcDrw@mail.gmail.com>
Subject: Re: [PATCH 14/18] tty: serial: samsung: return bool for s3c24xx_serial_console_txrdy()
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	andre.draszik@linaro.org, peter.griffin@linaro.org, kernel-team@android.com, 
	willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 10, 2024 at 4:25=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
> s3c24xx_serial_console_txrdy() returned just 0 or 1 to indicate whether
> the TX is empty or not. Change its return type to bool.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/tty/serial/samsung_tty.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsun=
g_tty.c
> index 63e993bed296..37c0ba2a122c 100644
> --- a/drivers/tty/serial/samsung_tty.c
> +++ b/drivers/tty/serial/samsung_tty.c
> @@ -2183,7 +2183,7 @@ static const struct dev_pm_ops s3c24xx_serial_pm_op=
s =3D {
>
>  static struct uart_port *cons_uart;
>
> -static int
> +static bool
>  s3c24xx_serial_console_txrdy(struct uart_port *port, u32 ufcon)
>  {
>         const struct s3c24xx_uart_info *info =3D s3c24xx_port_to_info(por=
t);
> @@ -2193,13 +2193,13 @@ s3c24xx_serial_console_txrdy(struct uart_port *po=
rt, u32 ufcon)
>                 /* fifo mode - check amount of data in fifo registers... =
*/
>
>                 ufstat =3D rd_regl(port, S3C2410_UFSTAT);
> -               return (ufstat & info->tx_fifofull) ? 0 : 1;
> +               return !(ufstat & info->tx_fifofull);
>         }
>
>         /* in non-fifo mode, we go and use the tx buffer empty */
>
>         utrstat =3D rd_regl(port, S3C2410_UTRSTAT);
> -       return (utrstat & S3C2410_UTRSTAT_TXE) ? 1 : 0;
> +       return !!(utrstat & S3C2410_UTRSTAT_TXE);

Again, personally I think !! is just clutters the code here, as the
function already returns bool. Other than that:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  }
>
>  static bool
> --
> 2.43.0.472.g3155946c3a-goog
>
>

