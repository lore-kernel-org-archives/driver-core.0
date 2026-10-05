Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507A747044B
	for <driver-core@lists.linux.dev>; Mon,  5 Oct 2026 10:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196054; cv=none; b=KUeiH91meUsWgsKC6urfh/0w7WuC2G7FsEoi0V1f+RoSKKRhKSuZZwn/pGM5VakYgesoJTkix08YE5dBXT5zg/h8Dd3F4JOclUEJcJ+OnMIFnNZJ/IUC9nS+ZpAzTY0hbTZ0aVh7s2cf3yiGWJcosjQnwMARBmMmYSxyH6T7YKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196054; c=relaxed/simple;
	bh=eNfnq2Z1m9vATI6IEOIp7uCuLn4LfwsvxoZBIRYjBQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W8w8ELrG75q0sswjNwxeNYVNahNiWhhdyjg07wKzM+SDUgVlIP3aygTqlt6ex7cFNxjH6rETvkm04T4TDeN2ELdTC3BzHlIu0yVER36E8zfeLUcQcGhDaw5i3keC3a8JEi2POqjKlCEPuYv5wWwwrIO4LQ7dc5ylKhH1+FEd1t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZipdCrqL; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZipdCrqL"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2dfa54c8ccfso2974995ad.0
        for <driver-core@lists.linux.dev>; Mon, 05 Oct 2026 03:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791196053; x=1791800853; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZCy7OWUxx6rxFKNFyknNAcEUj9iw0sI9ldfF6jwCKZc=;
        b=ZipdCrqL2GHkjnGjJigNiFW2V13O2RvGQAv1oOtv89X2H0bzpN2PBSnDdqViEkJqL+
         jTe9ZOTeKANqJ95dYKKUE47K/RwK71e/CFzImKmdwen8Q/b1PoLXPvK3Q0/Bs8DrHyMI
         sa5/AKBkHH8XgA24koBtCdj3HnrgDcCScWqy3GY564+McZdGsV4oFzrKDwnU05esmVuB
         cmVAXviW9y/WUgcf8LnKCVFtJfSGTAZx7rbMHckGqoX71Q+nKkkePRjM5BqeFqcq/KO5
         2A1Qa3ik9J/2Yw9x+Y7b+KkylLeR3LtkrYzt31lHEiWkCvRftRS7U0vYvxPtIrl6rdH+
         q4LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791196053; x=1791800853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZCy7OWUxx6rxFKNFyknNAcEUj9iw0sI9ldfF6jwCKZc=;
        b=eEac/QJvEuQvNYwflCPF5XESfxal6fB2PMmgGJuDvvc83SN6DvZH4yQkLKM83LGS6z
         x02M08zsMx3T+k45HDr5c8BNq6Zja1YcxbR52YVI7gbuZ4Pm8TTAV/Qqs/F2i6wy2BEt
         hBzIpKEWc/ZU2aFQqBRk40ysRIkl69bc78BN4ysu9QqPuFvqC2rVgbOEukQCcb4QRbF4
         p35DiwyF5naCanZntOqHX6phfu92zMOyuuxk/G7wgisF3OVsB2VcvnDUa2v/IR/hQa8Q
         T6GvepCXvrb9fhUi/e3ak9QgpwpI5zGvbJxO18pKNSGOMiI2XMUk8UdK7uSglZHDTAqI
         IgAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzC3PV6b6En7e/Kxd8F+qb/gSWxJYsWhcgHsPTalEeLG6s6F9hts87ZFkamtauLYEV/coBJAz2QfidoA==@lists.linux.dev
X-Gm-Message-State: AFq9FYJunoLlxrn+4HqcR4cqaTAgDUDW2of142qBErfBk14mIomYgGkT
	/oMQufRDOxKPICXlLrNEzuhpJtzsdzlUFCsdaFlFIZXmUgxzxT2qV7Df
X-Gm-Gg: AYBFou1qERD6PaA/Ch2mXToi4T66OiBP64vABxGSMFqdOTf3qX/gJ5YHXH6RnYg9lGS
	rUDM10SdCMqRf4WhB9s8ATmVAWf51qt24PvigKsca5rJFkvxle9RarDcz4V19Xupa93ErNSpe/Y
	bOlxac2dKFDIEmpqyfBWFX5BXmpqE1nDz/gQC263FRdba9sS7+ZW1C03L0NcRbgtiG2myi/cG5n
	mWpchi7AETycqVYcXtZa0yrqJrN5qHjomLBQlHWdh8Rl/M1a8BJcICDshqGgjY+7gCqLajMbfFK
	Z1JKiQ6HtXu7AScvv/oJZVM6a86S/xuqOamxgH+/+xbsn83nHTvB6Jar8olS9b61vjSL+bR8ZQk
	PB8EuZJ2IFZaqpQREwUa6KrH+sf9vb3htI5Axr4ReWgcOD7DZJVfD0766c4IIXRY1MSrE1bBDbH
	FLvwzsn76dNBnHA/Qr8H73/AgXgA5pZQSaIX6W6R5HVnsMAihRjCBEz6IjqZjvd9bw2E7kFKcv0
	XFL0YduFuyNix5wg0RDRK94O3q2NWtBhAGZoNZp2nK3N8GuVBYyc62eNxt7
X-Received: by 2002:a17:903:1663:b0:2e4:b6b5:b305 with SMTP id d9443c01a7336-2e4b6b5bfd2mr56716435ad.2.1791196052595;
        Mon, 05 Oct 2026 03:27:32 -0700 (PDT)
Received: from localhost.localdomain ([211.213.99.203])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5cae525sm5159935ad.19.2026.10.05.03.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:27:32 -0700 (PDT)
From: Hyeontaek Lim <jennystr233@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzbot+d164947c037324221043@syzkaller.appspotmail.com
Subject: Re: [PATCH] kobject_uevent: fix OOB read in kobject_action_type()
Date: Mon,  5 Oct 2026 19:26:57 +0900
Message-ID: <20261005102657.67522-1-jennystr233@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <2026092806-life-amazingly-e68d@gregkh>
References: <2026092806-life-amazingly-e68d@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

You're right -- I see now that this was already fixed by commit
d516455c9405 ("kobject: fix out-of-bounds read in
kobject_action_type()") from Jiacheng Xu, merged on Sep 24

Please disregard my patch -- it's a duplicate. I should have checked
linux-next and the existing lore threads before sending; 
I'm new to this and will be more careful next time. Sorry for the noise.

Thanks,
Hyeontaek Lim
