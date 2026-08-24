Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FB41B3925
	for <driver-core@lists.linux.dev>; Mon, 24 Aug 2026 04:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787546787; cv=none; b=NQOXXq8NPQc2GPquIa1YtXqaZABaGYHLNj9u/ifJ51DcAEY0PrlPJKYLeDEQ4d1lM1yS9mc13OzZiIs0uCZAMQSPNxS+keBq1QX2BXv2vMnW2caQc8RwZA+fnDIhl99uuVH2T8/8XDRIxBpT4Cy8OsEhiOYBSk6YusYp5OSVdVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787546787; c=relaxed/simple;
	bh=Qp/Qo50gT+ULoYvMdbBWvICXZmTPOc/Gxpuj7vBLL2A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WQ/9ri1TRyTitJojs3qAnCNMiDDI22pbozdNddx9L92aV4wQrX784no+1w+zjddRbr3czsZw+tyZixcFbyaqVVI+6OmyB0trcsY0Nfa+PN1GV9EnUptIp5LTyBUGiglO5oMosdYvGdhA1qkrWmcvTgTU8a5vZyAF0Ui2KnulHaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CAaL+rYO; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CAaL+rYO"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso3527697a91.2
        for <driver-core@lists.linux.dev>; Sun, 23 Aug 2026 21:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787546785; x=1788151585; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qp/Qo50gT+ULoYvMdbBWvICXZmTPOc/Gxpuj7vBLL2A=;
        b=CAaL+rYOiKfqnzPi3ZI4KEc9sk4QyBu7Tt0IySlMvAQuhfjLvcDtEnVv7QG8uOyeAA
         QeOLAGUCxub+BGNcGwMwXeto5lG8gEcHig9PRY6R1h/sE3nbTfjvmRHBOFhPNrVLoeBT
         h/SE/L5ZK1r5ZDtO2bfjjL7T7zdMaaBGtbzqSFEwbmyuvf9ZtQ+4FCKPoNKCTizpt8aC
         adK3NjFsm2bvn/PQLOohGMew0cszdHqnnvRQ0y2r4XkJbW492soxknmR5zdOsh89L7D9
         w6T7o3kA8i3XR9h848hClscAsFN2/i2WFMmqS/qNAjDKMRhqUovm2MsnPsp9UrBOhFFo
         N/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787546785; x=1788151585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qp/Qo50gT+ULoYvMdbBWvICXZmTPOc/Gxpuj7vBLL2A=;
        b=gU3eIWjCl5t13WKbfa4/XSf9jUsMVdBUHO3JwuC0K2CCy8cWh+iuKfxt0K4t05YRDM
         s9USnUPk+O3t//mscU559JNcoKWnEVE5sLoxemQLC7GF7e6lqIRjgldXl/3/6vOQlAnt
         TB7ixMQ/hQuagZjY8SyfWm28CdkZ7/ZpZ0otIzRUdA8H3YHG9hk1b16RqJf+UELrKOTu
         1dDZxqnULDIg4ZEjqJuVlA/WwUzSPqzs5oVTPyJ4FviDkVFpSk+3QusAEzLmHV2Nah9n
         HzPpo5HXGEm0H9LB4SJujP5B51xwyuVs7d/uGH55fjIqNAOFFaLf6TPtBkNuIDKXJ7Gh
         PmVQ==
X-Forwarded-Encrypted: i=1; AHgh+RoC1NQfmmthsQDJfwnBYq14iMt2llOoywojUz8pWySG2zm1UIcfTMCJGNjoQ3GnZWGWyh2u+xKD7KIM2w==@lists.linux.dev
X-Gm-Message-State: AFuF++nvR5BN7QJ8BiCwliT4pEVXorjI4yuUcZ4mfF/hAjuAmk5sWvG5
	LSWnXF4osBQMfe3OEay+R173jVQ+UmrPaVjZcqw9GbUOxznywUs05X7O
X-Gm-Gg: AR+sD11uksHSNRFynHbvm0drtKUdDlVSiRQpSxr3TsvjtPGl4xAWakwwB5DccfW0qUI
	xyDBHTpLJ90QXYiR6xpO5T3MeZgTj03uFfPhJxtpKDZGAjAgAuhR8vTLNuPPZxMTIwCNjmnL0tA
	kXGHS7ANpSVX2//xt73PXaZYbSRThol7wmWwpMD9lgDY9hNFfMobUFMWT1D53QWrVVyancxUtA2
	60vWr3MQq+M0CYJY38EQugziPrFN6AsdGeS3SckdgQOjjk8Ijw5+4IGwSzg31QTcRDtJPih8s9n
	UisHuXc/OTmVa0/4jDsNwnlaxsQfiuJbsYuA0zgivNYz5Xxp7z/WnAa2bmw5QS7NcSfYG6uKyFu
	e95tyboKO34tnHolIomHsLn7AgOPbtj3fnBeunfjFYe+nf2N6UMx4ldvMLAs/xTHoWyhprWE4H3
	l3oMfKE3gdGDBc3+Zvfeb1GhiatPVbimXRtA4GUwyJkbmIp8qSTa56lq9lFiO41N4QgFdVAZjz0
	PoLjrWvWsX6+oeRWGg6h29O
X-Received: by 2002:a17:90a:fc47:b0:380:105f:8ffd with SMTP id 98e67ed59e1d1-395df5e76b5mr30273473a91.16.1787546785169;
        Sun, 23 Aug 2026 21:46:25 -0700 (PDT)
Received: from ML-GYSUBT565.ECARX.COM.CN ([101.47.164.95])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e4969fb1sm8353772a91.1.2026.08.23.21.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 21:46:24 -0700 (PDT)
From: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Greg KH <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v4] driver core: avoid klist_remove() on unattached knode_driver
Date: Mon, 24 Aug 2026 12:46:20 +0800
Message-Id: <20260824044620.45013-1-khiemtranzo532001@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In-Reply-To: <DKU2J83B6IX6.2CG1WOB66WC39@kernel.org>
References: <DKU2J83B6IX6.2CG1WOB66WC39@kernel.org>

On Fri, Aug 21, 2026 at 03:54:44AM +0200, Danilo Krummrich wrote:
> usb_driver_claim_interface() is the only callsite in the kernel that
> does set dev->driver without a subsequent device_bind_driver().

Small correction, I think there are a few more. usb_port
(drivers/usb/core/port.c:782) sets dev->driver before device_register(),
and usb_port_driver has no ->match and no ->probe, so it depends entirely
on the __device_attach() dev->driver path to get bound. ccwgroup
(drivers/s390/cio/ccwgroup.c:385) and pata_parport
(drivers/ata/pata_parport/pata_parport.c:515) do the same. So that path
doesn't look USB-claim-specific, and if we ever want to remove it,
usb_port would need a ->match() first.

For the root cause, what about this: in usb_driver_claim_interface(),
when the interface isn't registered yet, just don't set dev->driver --
record the claim on struct usb_interface instead. Then, once the
interface gets added in usb_set_configuration(), bind it explicitly with
device_bind_driver(). That skips ->probe, which is exactly what
usb_audio's claim-now-bind-later needs, and it also attaches
knode_driver so teardown is safe. The __device_attach() path can stay
for w1/ccwgroup/pata_parport.

Does that sound reasonable?
