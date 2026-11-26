Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795652266;
	b=KWd7lFW2tAUaYWbNfpJltkhkIwlsHdmR4MSbIjrEleRmnBKRQ8U9FfcweSxUxVjIoRA9
	 JR8cZmXHmg9UknWDKLFUS5TzYB+y7KDyrsTIUVR0g7Ur3YenZJoEo+xP8wNACwLQ0IWfL
	 XMJira4I2DmOLbTyCznplEEiTbdYo4Q/SZyqMdPtXJ5GAWhZD+tLc41BmDi6nf2IDju0+
	 WcC8xgKobQATMGPsqJKoiED/9Fs7Dj7CLXbiLMLMv/mwhJLXSlbOAhQ1FSq3W4kRkCVUc
	 i8OGV/mguaVb8pkAzQCPkAZUt0jzWvWctbGRw18AxLuremURxFvdWGV8WwtQxvSgN3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795652266;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:X-Patch-Reply:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=o2dy+vkrNlVbs/5Vvz8cY82caOEYyUTk4tmWQxDpREg=;
	b=Aj1CbYHrKbVecTjWHZFx8Ub4kQSXtymQYdom8R6Ah5xGTJk6G3O1OvEDKrq6SuBanwX0
	 47jLVZLbQZB4V8DP50ZVSgStPYYdUQtuv3gVFidhPIl7DdDclHOr47Mn/XC5ubH84nKsc
	 FMUrY4LlBhav+JatrFXD22W742JiETmJRu2dy2Oar5Xmnsbja8F9G1PO7O+TV/YyaAdgb
	 bX4dii38TcS/0pE+66c70+p/Ss4p8qb/RI2Vmk7DxPs7HYm98W9Vtc9NjGJETH0O1Reg2
	 iRpjnyZiM4ENaaaG6mDpPSugp4giOX8PYmjJoFXlUAgTeVwZTW5D2tanju9K5qINEcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K4V2wl3q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E491606A31E;
	Thu, 26 Nov 2026 00:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K4V2wl3q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02DE11F000C4;
	Thu, 26 Nov 2026 00:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795652265;
	bh=o2dy+vkrNlVbs/5Vvz8cY82caOEYyUTk4tmWQxDpREg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=K4V2wl3q0PfSk+8qIB28osMwcToIOuMUYbgRaPPEJXn5KqL061yeyby+ELkhwU8QC
	 jGI8mmaxCub0tXMvhu1zczMSaxqU7XgaUM/ljtpc9GcBEFWb7JyoviGztGgu7MiSsP
	 ZIiqXq2xyP/tPABkYuj1Ax5Jk9sWjIBu8YmClw2AGdOn5Gg7C8UCqtJ2w2AEVHXHkZ
	 +28wzMXPZovDu+vkqNxNcz/4yEtbxjYeUdZwNIAiuaUHedr34GnjN0pErSUZlTes0w
	 ae1Z93iY7gi447N4yyryzjopzoQ6Nv3qE4OD7Z+YTuku5wMnXFXxELAAUQkSqlDyIu
	 E+BEP8F0UzDtA==
From: Danilo Krummrich <dakr@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] driver core: fix race between bus_remove_driver() and dev_driver_uevent()
Date: Thu, 26 Nov 2026 01:17:41 +0100
Message-ID: <20261126001741.3101394-1-dakr@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123012604.3882115-1-dmitry.torokhov@gmail.com>
References: <20261123012604.3882115-1-dmitry.torokhov@gmail.com>
X-Patch-Reply: applied
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 22 Nov 2026 17:26:04 -0800, Dmitry Torokhov wrote:
> [PATCH v2] driver core: fix race between bus_remove_driver() and dev_driver_uevent()

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/1] driver core: fix race between bus_remove_driver() and dev_driver_uevent()
      commit: 31ce79bc345e

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is in the driver-core-testing branch and will be promoted to
driver-core-next after validation.
