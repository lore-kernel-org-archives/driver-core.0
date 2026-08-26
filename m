Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5E52D94BA
	for <driver-core@lists.linux.dev>; Wed, 26 Aug 2026 14:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787754873; cv=none; b=bQbA3UhpK5XPgJ5z3GWZaqY/gNiS9Wcj81/hFoLrLVX/9NG9enpq7fPnNIS9SE6K07LuuUT4/61GsKV7XnryC4JX4vqHcPJiQuqzGyE07R5xtApDDwsYeW+q5CfuV2jnuae2vyfkGXrghZfpG+b63tlOdCMTHvi5DHmXwDMOxnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787754873; c=relaxed/simple;
	bh=Km0jfw8QnVzbKQXAfJBC7Sw6FTLawQh0UdpyDlUSlsE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=hF0SWneR/jmc39HQqsw7tZE4QPkQK8j+Gbx/IjbRNstms248PPcehra8qsHYZGJKMDdp7qBLH3Q3ScBpJyFthFWXOZEAD6Kr8UVG/jmCYrAEBmXN6NBuL2SF9K13RDxsgeV0HOa3iavXO++3XJEpVUkACIV5628o9oCDhbTBYAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=rdRK2hf8; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=nIfOmEiO; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="rdRK2hf8";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="nIfOmEiO"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1787754842; bh=Km0jfw8QnVzbKQXAfJBC7Sw
	6FTLawQh0UdpyDlUSlsE=; b=rdRK2hf8C/U6FmwNu8ujrLuM5IPXGGHd1Ed9auy4XCJ7IRWZTh
	/r6YyiDClnidnsa3MhPOH/2cGbZ1AhHwKqbE5OtEsHw81sKBzNhuN4gBKAbkhfnlCf290skB3nE
	xMwAS8uPNrS6sXo3hwrFgJ+iE4Td01goHl9l2f/fpNXFTVN8mZL9UieF4HQqckbqoDS+i0UqXgV
	kUskcPBv7vf8dmC0M5wMhfh1aGXHbsF/Ck1GAUjImP6nKwhnpWPWFDZ7FbYgzw2QAYlvptKcn9I
	hh3nfnDaeaC10S24XuLA6WJGXasb3Oy+ayl9chEaGwe+MiHJHEK1u4rXveQtNdtL3dA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1787754842; bh=Km0jfw8QnVzbKQXAfJBC7Sw
	6FTLawQh0UdpyDlUSlsE=; b=nIfOmEiOiZDuJoNTPvfnV6gMcnPzfP69KVBh+YhfhknpeMQVfu
	ZDas9M7+dLU+A2I+sr5yenLiZAYhHMfcMBDQ==;
Date: Wed, 26 Aug 2026 15:34:00 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Steven Rostedt <rostedt@goodmis.org>
CC: gregkh@linuxfoundation.org, atomlin@atomlin.com, corbet@lwn.net,
 da.gomez@kernel.org, dakr@kernel.org, driver-core@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, mathieu.desnoyers@efficios.com, mcgrof@kernel.org,
 mhiramat@kernel.org, petr.pavlu@suse.com, rafael@kernel.org,
 rdunlap@infradead.org, samitolvanen@google.com, skhan@linuxfoundation.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_2/2=5D_driver_core?=
 =?US-ASCII?Q?=3A_add_TAINT=5FFORCED=5FBIND_for_?=
 =?US-ASCII?Q?when_userspace_manually_messes_with_devices_and_drivers?=
In-Reply-To: <20260826102646.46da2be8@gandalf.local.home>
References: <20260826-bind_taint-v1-2-52b05f4a965c@linuxfoundation.org> <C35F2CF9-9CD7-482F-8F30-2D152AB42D0B@mainlining.org> <20260826102646.46da2be8@gandalf.local.home>
Message-ID: <DB2427C5-303A-4929-8A44-4DBAC9FADFEA@mainlining.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 26 August 2026 15:26:46 BST, Steven Rostedt <rostedt@goodmis.org> wrote:
>On Wed, 26 Aug 2026 12:58:00 +0100
>Bradley Morgan <brads@mainlining.org> wrote:
>
>> sashiko found a couple valid concerns for 2/2
>
>Sashiko will respond to the email if it Cc'd linux-trace-kernel, which
>Greg
>did. No need to mention Sashiko. It can speak for itself ;-)

Soz, wanted to get CC'ed to V2, if I didn't say anything, I wouldn't get
CCed, simple

I'll review it in V2, it looks fine to me but with a couple nits, I wanna
see Greg's V2 first.

>
>-- Steve

--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
