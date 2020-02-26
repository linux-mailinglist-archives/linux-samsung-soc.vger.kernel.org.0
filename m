Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F86F170819
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 26 Feb 2020 19:55:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727105AbgBZSy7 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 26 Feb 2020 13:54:59 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:47081 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726878AbgBZSy7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 26 Feb 2020 13:54:59 -0500
Received: by mail-ed1-f65.google.com with SMTP id p14so972edy.13
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Feb 2020 10:54:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=U+IpO69+PEFzToUDuskUIbssFdlPYtSxvz8UlCOLm8A=;
        b=l54eJ1eakOMHKFpfNfJOTrqE6DsMVhA4r7484qdpwXRzvPAdzBfSU5C/594y1rs2cF
         jHBXKYOsD5VuzYyjtPX6rZoXlv8dS6jtaQPQnF/6ogzTmngiJioDe4f96D2j1IF/1UG3
         iup8IxTF1yYwaxFaMJXmfkP6Lk8HTChVcyyZkVBRHW5EjuYzWv0ioMfQeZ1EI7xSSpdb
         Ufch3yZ/NxyYc3h1dr+4OgmeQCT3RLiJ/yvIBmClg44P+yPl6Cp1kb5Eldz5fH9m7FvZ
         y9u1SMSnq3Zs0nYeGQIYnuiGpKEtHjUdK2jSiyBf7xYy7QMXzPFPVD0oXvYK162yZ4En
         zGYQ==
X-Gm-Message-State: APjAAAVUmk6+XdEH4aqWfatTZ/RaTd01hSzST6L+NnZwRbu9/MAk4n1Y
        UwrKPv9xdghLGe0BJ6xD/Vm6+DLYum8=
X-Google-Smtp-Source: APXvYqzZtBYE+h7oeDJZJr7pArWJiWlACB0hEkrilfFugh0djbYKbZGIQrkvTgJDGp9aAW5LFW9IHQ==
X-Received: by 2002:a50:f609:: with SMTP id c9mr699658edn.321.1582743298357;
        Wed, 26 Feb 2020 10:54:58 -0800 (PST)
Received: from kozik-lap ([194.230.155.125])
        by smtp.googlemail.com with ESMTPSA id y25sm187370edu.79.2020.02.26.10.54.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 10:54:57 -0800 (PST)
Date:   Wed, 26 Feb 2020 19:54:55 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos: Fix memory on Artik5 evaluation boards
Message-ID: <20200226185455.GA21753@kozik-lap>
References: <CGME20200225114025eucas1p2f34775ccb42b2892edf732f8eb0722ba@eucas1p2.samsung.com>
 <20200225114017.29267-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200225114017.29267-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Feb 25, 2020 at 12:40:17PM +0100, Marek Szyprowski wrote:
> The last 8MB of physical memory on Artik520 family boards is reserved for
> secure firmware. Adjust the total amount of the memory defined in
> exynos3250-artik5.dtsi to match the memory available for the Linux kernel.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos3250-artik5.dtsi | 2 +-

Thanks, applied.

Best regards,
Krzysztof

