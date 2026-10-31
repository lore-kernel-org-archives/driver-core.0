Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793473826;
	b=apZEeQxmRcVPikZzK3R0qqCr6nHQ5sMpL9zYCBp7PWtRngDC9VQ8PzwcmOps85CCclT3
	 MnW36EloEhqWTF2C0/kbrHzuvLLCPwNQHEL2Z9XI6FFtoztjYy0VHJqkG7v5JSP0kNc1o
	 f3Ts4zpd1EkUB3ECLm4FPpsgnX3ZavWcqXeAcgVA14raNfqXF9/33wzytN/lV0JFagnXF
	 7q5o2Zh1LTJ7XxpJE4cWLB84rYWauLK7zsYdC0m3/wk5Kz0yaNMOXgyGcGk2CHUiDPvCG
	 qsF3l0o3YnEIdo4Kms4PqqpIKXXsdWDN7Q+Fr4juRd0NSJWI297pTm9wpcc2fhoGJAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793473826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=P15p9Hb5w1tBvsdlJFg638wJNRLHIyW6DyqlyUCSHFc=;
	b=NlHebpHMHR/AozRJ0w+66pRhDkqWXXFDyxR4fDFTZT3mBao5mCCPDDzQ/NkR53TnqlKw
	 JmcZeC/OoHigo2BlEHVuwmQJcvkrVZTqDN/5LQJOrJVJOkrV1KmKSRS7IRDx9StBDhF5x
	 3mXy4LptKLZjSpBbKnzPB1nPI5YIZHBfVTAWwefkcbUhNgZmG/ShPxMM7bHcxK4z5od1W
	 dcb2FHeuLzwjAEW1tqXLPEsgvgdbUNrz7Gn9ON5XRVAAkmxsGWL+v59c0ykjlqJM4PnJu
	 HkmdrhevlY5RyNo/J/cIkAZn6AJ/S8qGsm8i0NpLLd0e4CJTJdgorOopql3Sqka+BAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=Z57coJKT;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A72606A31A
	for <driver-core@lists.linux.dev>; Sat, 31 Oct 2026 19:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2A72606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=Z57coJKT
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so3123694eec.1
        for <driver-core@lists.linux.dev>; Sat, 31 Oct 2026 12:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1793473825; x=1794078625; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P15p9Hb5w1tBvsdlJFg638wJNRLHIyW6DyqlyUCSHFc=;
        b=Z57coJKTaLzK/2PDroxkjrXJ3XGvH9APLHDXbDmDg15LVz9fNTnhTgaPc/ixl3f4lP
         IijhXrGg++cVisUb5Th6qxEcYah6x+cXIVj7mNfnR6u1NULyV8ZHtGkzShf7U8WR+XIf
         lc3VV5yYEyyzRahJj+pE1YnfEh6UtI1EikUNwbgekXaTjT2GBcbHVwIMonsnH28PgxMK
         h1OsfMapmG3JtSQtUvtekMQXYiJwfvs0J81xhz6QG9QzNKpyZt/jVM9nIVI2b4oHrlK2
         iJZTaVDU+QIHqdKGMWqfxc1o0pVWXKEBIJV9InvZUVIIbMq8rpVQ/fqnCiYHbAeiEF6S
         YaDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793473825; x=1794078625;
        h=content-transfer-encoding:mime-version:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P15p9Hb5w1tBvsdlJFg638wJNRLHIyW6DyqlyUCSHFc=;
        b=IaoxGRJ1jMZMrEmlLtwSj0KE1GLwoN1gzlDVjZXiY6hitPXnolk9lOT4MbKqrt9dx4
         clkvig2eV823C0jxabqZ+DZJNQaV/RcfXfQKuf5vmFxwtngOvb3wKMEdypFhrdlg1px8
         uxT32aYL7SBJaLnABgUk1JE4UsfeGOeewPxlVXz0gT3puOeJDvArsBVCxZcfihQGW0eU
         zK7jY8sgeTHM7tTBl9JLA3PCLnTmKzpgVQ+4LiTr8NzdNY5T1nAqv3TVSewZynnCPaGA
         Saa1bFVdjX76BzISAPA6eK4yDeMEmOloFlUqdos8DIhw3HrGj/8GtDtBgE9gEfSN4bqH
         E1nA==
X-Forwarded-Encrypted: i=1; AKwUvBy7xKlAYNIGLCBYIvD7Om1OMHyn6RHfoXMI8TMP0HPDsTiKfg5vSmf79C1re+hYHTtIGo4XNl4l84eSJw==@lists.linux.dev
X-Gm-Message-State: AFq9FYJut7F/5DwoUTMFPxYVsGigbtF+8t301SR7q56bfn0vHPNUtVoc
	rhv9YWicM8kwpR/49DCEvE9uu9HRLjp6oEwwiweJZ/Gllzs1dGAvOQHaIj+gFY1F+dQ=
X-Gm-Gg: AYBFou3efy4t7jAROuQKrCyLzBDyhKk/kDZ+66kZHAFzOi+QiF97WONCwN/giv+Fn0a
	tS/jvZUzjcIUWTfuMqOrRxQhVQIkQO/CLtDto0YmsbzR4BbOKpAm28cFVWS54PYxpBy+Ork/9B2
	TI3Xjk3rnxR1EUzNNL4Xp5fHhZrUel9Q/Pzh4N9E/Lt8JZ+pfCL+Ydf3bqcR3jy5/K+lLGAoTmX
	1wWNIiES1TTs0BjSP3NVM8yZ27ZFPk7BZZ4O7UjM0fei5RwICmz0G1/ndmQMgeIFCxKtnRCHq0S
	g8zZmMB5wmCdzJqEEQm/L50yV44xzxCJ2/OLT/tmSkaDAUkSbcMZHZcnMTpLsnVRYhSx36yKMDg
	IJx/ew/nfVy/fkyTc7xp7T/D3fL7N2EimykPxiuLWikEj6CAx8GwYSsypOcRju9TqMjXYtzGHAA
	spoku+S7vtvY7yptfBnnE2wt/EqR8pb9/ZfozlOM83FqDAY3yhYg3grVGNkK6dXVr7jgT24eUzT
	tCL/m5EcMm9U2A7WwFTU9V7cShHdMxO8XIjoOOu2nB6r6gtLbtJv/f+sAtXDXIMaX2DCT83ehUf
	FfsufPYV+0k8E+Jj+0wwyXSpNGjvaGa0aJcLqX3G3KSim4vo/UU=
X-Received: by 2002:a05:701b:4515:20b0:166:5552:780a with SMTP id a92af1059eb24-1ac5b028b11mr7948547c88.8.1793473824427;
        Sat, 31 Oct 2026 12:10:24 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1b38ac58sm17384804c88.23.2026.10.31.12.10.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 12:10:23 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Oct 2026 12:10:22 -0700
Message-Id: <DMJ9ERWOMF5G.3KVDIP2QE3A7J@nexthop.ai>
Cc: "Richard Cheng" <icheng@nvidia.com>, "Andrew Lunn" <andrew@lunn.ch>,
 "Rob Herring" <robh@kernel.org>, "Saravana Kannan" <saravanak@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Charles Keepax" <ckeepax@opensource.cirrus.com>,
 "Richard Fitzgerald" <rf@opensource.cirrus.com>, "David Rhodes"
 <david.rhodes@cirrus.com>, "Linus Walleij" <linusw@kernel.org>, "Andy
 Shevchenko" <andriy.shevchenko@linux.intel.com>, "Daniel Scally"
 <djrscally@gmail.com>, "Heikki Krogerus" <heikki.krogerus@linux.intel.com>,
 "Sakari Ailus" <sakari.ailus@linux.intel.com>, "Bartosz Golaszewski"
 <brgl@kernel.org>, "Len Brown" <lenb@kernel.org>, "Davidlohr Bueso"
 <dave@stgolabs.net>, "Jonathan Cameron" <jic23@kernel.org>, "Dave Jiang"
 <dave.jiang@intel.com>, "Alison Schofield" <alison.schofield@intel.com>,
 "Vishal Verma" <vishal.l.verma@intel.com>, "Dan Williams"
 <djbw@kernel.org>, "Ira Weiny" <iweiny@kernel.org>, "Li Ming"
 <ming.li@zohomail.com>, "Lizhi Hou" <lizhi.hou@amd.com>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-pci@vger.kernel.org>, <linux-sound@vger.kernel.org>,
 <patches@opensource.cirrus.com>, <linux-gpio@vger.kernel.org>,
 <linux-acpi@vger.kernel.org>, <linux-cxl@vger.kernel.org>, "Allan Nielsen"
 <allan.nielsen@microchip.com>, "Horatiu Vultur"
 <horatiu.vultur@microchip.com>, "Daniel Machon"
 <daniel.machon@microchip.com>, "Steen Hegelund"
 <steen.hegelund@microchip.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v13 00/10] lan966x pci device: Add support for SFPs, PCI
 part
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Herve Codina" <herve.codina@bootlin.com>
In-Reply-To: <20261012142826.159178-1-herve.codina@bootlin.com>
References: <20261012142826.159178-1-herve.codina@bootlin.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Herve,

On Mon, Oct 12, 2026 at 04:28:14PM +0200, Herve Codina wrote:
> Patches 8 and 9 fix fw_devlink issues specific to PCI and the
> device-tree nodes created during enumeration.

We hit exactly this on x86 switch platforms with
CONFIG_PCI_DYNAMIC_OF_NODES. A driver applies a device-tree overlay
onto each Xilinx FPGA PCI endpoint and populates I2C controllers
(xiic), watchdogs and GPIO blocks. Their interrupts go through small
chained irqchips that are themselves fed by the FPGA's MSI vectors.

Without this series, fw_devlink drops every supplier link under the
synthesized PCI root bridge node ("Not linking ... might never become
dev"), so the irqchips end up with no consumers. Unbinding one of them
frees IRQ descriptors that the I2C controllers and the watchdog still
hold. We get a remove_proc_entry "removing non-empty directory 'irq/N'"
WARNING per IRQ, and the I2C controllers are dead until reboot.

With the series applied on v7.3, the device links are created (up to
32 consumers per irqchip), and unbinding an irqchip now unbinds its
consumers first. I tested on two platforms, with 2 and 3 FPGAs (4 and
7 irqchips). Repeated unload/reload of the irqchip driver was clean
every time, and everything probed again afterwards.

Tested-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Thanks,
Abdurrahman
