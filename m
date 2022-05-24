Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F54F532028
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 24 May 2022 03:08:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232563AbiEXBIa (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 23 May 2022 21:08:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbiEXBI3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 May 2022 21:08:29 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29CBC45AFA;
        Mon, 23 May 2022 18:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=g+1onVYFnItp+5juP3Mp5ZFyrYlSFrejl1PLGqm8Sos=; b=fuoEPu0Ti2GVvuzxN85++WCmr3
        xlEn4/jPETWxAV3uOKTPm5E1CtvobTWsweUiGRQCG1QNPCl4lkRJlPZaQSbXEyA7iOrDRe5IndTgt
        hYJ+mkBJv4yC9LysmyoHUHJdzXhIKpRyBpo23xo/Nbpn6xeD79oTknhnwGx9BXm5qMfw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1ntJ1r-0042j5-EC; Tue, 24 May 2022 03:08:07 +0200
Date:   Tue, 24 May 2022 03:08:07 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Lukas Wunner <lukas@wunner.de>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Steve Glendinning <steve.glendinning@shawell.net>,
        UNGLinuxDriver@microchip.com, Oliver Neukum <oneukum@suse.com>,
        Andre Edich <andre.edich@microchip.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Martyn Welch <martyn.welch@collabora.com>,
        Gabriel Hojda <ghojda@yo2urs.ro>,
        Christoph Fritz <chf.fritz@googlemail.com>,
        Lino Sanfilippo <LinoSanfilippo@gmx.de>,
        Philipp Rosenberger <p.rosenberger@kunbus.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Ferry Toth <fntoth@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH net-next v3 5/7] usbnet: smsc95xx: Forward PHY interrupts
 to PHY driver to avoid polling
Message-ID: <Yowv95s7g7Ou5U8J@lunn.ch>
References: <cover.1652343655.git.lukas@wunner.de>
 <748ac44eeb97b209f66182f3788d2a49d7bc28fe.1652343655.git.lukas@wunner.de>
 <CGME20220517101846eucas1p2c132f7e7032ed00996e222e9cc6cdf99@eucas1p2.samsung.com>
 <a5315a8a-32c2-962f-f696-de9a26d30091@samsung.com>
 <20220519190841.GA30869@wunner.de>
 <31baa38c-b2c7-10cd-e9cd-eee140f01788@samsung.com>
 <20220523094343.GA7237@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220523094343.GA7237@wunner.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

> @@ -976,6 +977,25 @@ static irqreturn_t phy_interrupt(int irq, void *phy_dat)
>  	struct phy_driver *drv = phydev->drv;
>  	irqreturn_t ret;
>  
> +	if (IS_ENABLED(CONFIG_PM_SLEEP) &&
> +	    (phydev->mdio.dev.power.is_prepared ||
> +	     phydev->mdio.dev.power.is_suspended)) {
> +		struct net_device *netdev = phydev->attached_dev;
> +
> +		if (netdev) {
> +			struct device *parent = netdev->dev.parent;
> +
> +			if (netdev->wol_enabled)
> +				pm_system_wakeup();
> +			else if (device_may_wakeup(&netdev->dev))
> +				pm_wakeup_dev_event(&netdev->dev, 0, true);
> +			else if (parent && device_may_wakeup(parent))
> +				pm_wakeup_dev_event(parent, 0, true);
> +		}
> +
> +		return IRQ_HANDLED;

I'm not sure you can just throw the interrupt away. There have been
issues with WoL, where the WoL signal has been applied to a PMC, not
an actual interrupt. Yet the PHY driver assumes it is an
interrupt. And in order for WoL to work correctly, it needs the
interrupt handler to be called. We said the hardware is broken, WoL
cannot work for that setup.

Here you have correct hardware, but you are throwing the interrupt
away, which will have the same result. So i think you need to abort
the suspend, get the bus working again, and call the interrupt
handler. If this is a WoL interrupt you are supposed to be waking up
anyway.

	Andrew
