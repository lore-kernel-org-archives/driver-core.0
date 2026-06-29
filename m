Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BD74071D6
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 12:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782736956; cv=none; b=Ps+1A30Yh+tQltBOsONXR0P755DjLu52cRzes/+bw4MEiWTj0buBQsWggsrBfHAdcdlBWYlmYZZn4RrTWfh8LOwC2jg+vaLh5B8I72ICxga5pqMKO6LnLKm67AWg1CweiIznSr8uentsoRVlbX53Sr5cV0wQageIcpY5Zirso+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782736956; c=relaxed/simple;
	bh=FY7BarU+XvQL2lwFnmn8TQJQaaUkOQTqErCuNF2Evo8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:Content-Type:
	 MIME-Version; b=OHwLiV0low2fcYG6sAcCWFeTn7HxY5I8yJ56SsGjf8cJ2RoYUHYzY4mtNGuXNIv9//Kgr45zY4kLgqW65oJbLVzKh/NGs7uky8E+XfksuDs/0mvY2Sdf9tCtQJlB2eEEX86xtGum6TfoFk/vO0Q0LcG2AR/n0beJMNtm4Gq7CA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=e+x40MFW; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=HFf/MU2c; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="e+x40MFW";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="HFf/MU2c"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gpmBx07mTz9tsk;
	Mon, 29 Jun 2026 14:42:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782736953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to;
	bh=FY7BarU+XvQL2lwFnmn8TQJQaaUkOQTqErCuNF2Evo8=;
	b=e+x40MFWfLUZH3y0RjP6SprarNyJmzZmYBSN4rO/Y/d6dgUQi/LIud5ZyF1wk9mSxTHEN7
	BSu5uWqtfyDjK/UjC1I+lF+2IoqF/zZavtouyryYixJ6zX1H6V2Xs0TR3yhxuMYdowAcFX
	U8bVEGB5lLsVdwDrwKBKvsPHosEcp4hqWJC0FWGydWjH9mo3d1f5HEZCmnEhKmL5OOQU/u
	hqrvNjZTqru3dgvw5B6NB2bTFoSP6WynTKr3dEnZLUGYUJh9KcO3HjI3hpPOLyOXEGtlM7
	a+u1ZnV+GsRl/p/J+2JX4lmgmL73ny8Bbdk0irgK50HFi2f0vQaMPRlfO7Dxpg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="HFf/MU2c";
	spf=pass (outgoing_mbo_mout: domain of manuelebner@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=manuelebner@mailbox.org
Message-ID: <0ffa2438b7d7d131e71e118f1a3893c471080cd7.camel@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782736951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to;
	bh=FY7BarU+XvQL2lwFnmn8TQJQaaUkOQTqErCuNF2Evo8=;
	b=HFf/MU2ct9VQk09I/fzVvtch2gOU6IgSZZoJcNhS1xm1mN51FjTtF8aD7ysFXz53AWDzgS
	roM69tigk/pYMqz7u/JRySiGmlPjIrhDmLQ4WZVmgMqOfi6JK8Nl26eQnOK5ovXcFjisfJ
	RcmqMEgxpAHDynpACV5EP/k5ENzZBmJ4UMb8yZ/efjKLSAGlu6vGpaQ8VBwAMGBQG4scNv
	1EGwbRyUEg1LLIwlrUH70a9K8Iu4x2zPbobD4/+AAkgzMkfu9VoB6oPjBu2VNMvgYQUf9D
	p9GEv8ZEgOV2QYZxdU3qAxFOF0IamFCSb7eSOsdJd4ZQmIcmnGGNZN/ljop7BA==
Subject: Re: [PATCH] docs: ABI: sysfs-uevent: add missing bracket
From: Manuel Ebner <manuelebner@mailbox.org>
To: manuelebner@mailbox.org
Cc: dakr@kernel.org, driver-core@lists.linux.dev,
 gregkh@linuxfoundation.org, 	linux-kernel@vger.kernel.org, rafael@kernel.org
Date: Mon, 29 Jun 2026 14:42:26 +0200
In-Reply-To: <20260612145331.189632-2-manuelebner@mailbox.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MBO-RS-ID: 31c7498e29313e14442
X-MBO-RS-META: wm49iw4ndyhnfpngo84sg4bhog6xpy75
X-Rspamd-Queue-Id: 4gpmBx07mTz9tsk

Hello

is this patch still on it's way?

Thanks
 Manuel
